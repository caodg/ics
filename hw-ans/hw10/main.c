#include <errno.h>
#include <fcntl.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/unistd.h>
#include <unistd.h>

#ifndef NDEBUG
#define debug_printf(...) printf(__VA_ARGS__)
#else
#define debug_printf(...)
#endif

#define DEFAULT_DOWNLOAD_DIR "./download"
#define DEFAULT_DOWNLOAD_URL "eecs.pku.edu.cn"
#define BUFFER_SIZE 256

/* macro that check return value */
#define ENSURE(expr, before_ret)                                               \
    do {                                                                       \
        if (!(expr)) {                                                         \
            before_ret;                                                        \
            return -1;                                                         \
        }                                                                      \
    } while (0)

/* copied from csapp */
int open_clientfd(char *hostname, char *port) {
    int clientfd;
    struct addrinfo hints, *listp, *p;

    /* Get a list of potential server addresses */
    memset(&hints, 0, sizeof(struct addrinfo));
    hints.ai_socktype = SOCK_STREAM; /* Open a connection */
    hints.ai_flags = AI_NUMERICSERV; /* ... using a numeric port arg. */
    hints.ai_flags |= AI_ADDRCONFIG; /* Recommended for connections */
    ENSURE(getaddrinfo(hostname, port, &hints, &listp) == 0, );

    /* Walk the list for one that we can successfully connect to */
    for (p = listp; p; p = p->ai_next) {
        /* Create a socket descriptor */
        if ((clientfd = socket(p->ai_family, p->ai_socktype, p->ai_protocol)) <
            0)
            continue; /* Socket failed, try the next */

        /* Connect to the server */
        if (connect(clientfd, p->ai_addr, p->ai_addrlen) != -1)
            break; /* Success */
        ENSURE(close(clientfd) == 0, freeaddrinfo(listp));
        /* Connect failed, try another */ // line:netp:openclientfd:closefd
    }

    /* Clean up */
    freeaddrinfo(listp);
    if (!p) /* All connects failed */
        return -1;
    else /* The last connect succeeded */
        return clientfd;
}

/* $begin rio_t */
#define RIO_BUFSIZE 8192
typedef struct {
    int rio_fd;                /* Descriptor for this internal buf */
    int rio_cnt;               /* Unread bytes in internal buf */
    char *rio_bufptr;          /* Next unread byte in internal buf */
    char rio_buf[RIO_BUFSIZE]; /* Internal buffer */
} rio_t;
/* $end rio_t */

ssize_t rio_writen(int fd, void *usrbuf, size_t n) {
    size_t nleft = n;
    ssize_t nwritten;
    char *bufp = usrbuf;

    while (nleft > 0) {
        if ((nwritten = write(fd, bufp, nleft)) <= 0) {
            if (errno == EINTR) /* Interrupted by sig handler return */
                nwritten = 0;   /* and call write() again */
            else
                return -1; /* errno set by write() */
        }
        nleft -= nwritten;
        bufp += nwritten;
    }
    return n;
}

/*
 * rio_read - This is a wrapper for the Unix read() function that
 *    transfers min(n, rio_cnt) bytes from an internal buffer to a user
 *    buffer, where n is the number of bytes requested by the user and
 *    rio_cnt is the number of unread bytes in the internal buffer. On
 *    entry, rio_read() refills the internal buffer via a call to
 *    read() if the internal buffer is empty.
 */
/* $begin rio_read */
static ssize_t rio_read(rio_t *rp, char *usrbuf, size_t n) {
    int cnt;

    while (rp->rio_cnt <= 0) { /* Refill if buf is empty */
        rp->rio_cnt = read(rp->rio_fd, rp->rio_buf, sizeof(rp->rio_buf));
        if (rp->rio_cnt < 0) {
            if (errno != EINTR) /* Interrupted by sig handler return */
                return -1;
        } else if (rp->rio_cnt == 0) /* EOF */
            return 0;
        else
            rp->rio_bufptr = rp->rio_buf; /* Reset buffer ptr */
    }

    /* Copy min(n, rp->rio_cnt) bytes from internal buf to user buf */
    cnt = n;
    if (rp->rio_cnt < n)
        cnt = rp->rio_cnt;
    memcpy(usrbuf, rp->rio_bufptr, cnt);
    rp->rio_bufptr += cnt;
    rp->rio_cnt -= cnt;
    return cnt;
}
/* $end rio_read */

/*
 * rio_readinitb - Associate a descriptor with a read buffer and reset buffer
 */
/* $begin rio_readinitb */
void rio_readinitb(rio_t *rp, int fd) {
    rp->rio_fd = fd;
    rp->rio_cnt = 0;
    rp->rio_bufptr = rp->rio_buf;
}
/* $end rio_readinitb */

/*
 * rio_readnb - Robustly read n bytes (buffered)
 */
/* $begin rio_readnb */
ssize_t rio_readnb(rio_t *rp, void *usrbuf, size_t n) {
    size_t nleft = n;
    ssize_t nread;
    char *bufp = usrbuf;

    while (nleft > 0) {
        if ((nread = rio_read(rp, bufp, nleft)) < 0)
            return -1; /* errno set by read() */
        else if (nread == 0)
            break; /* EOF */
        nleft -= nread;
        bufp += nread;
    }
    return (n - nleft); /* return >= 0 */
}
/* $end rio_readnb */

/*
 * rio_readlineb - Robustly read a text line (buffered)
 */
/* $begin rio_readlineb */
ssize_t rio_readlineb(rio_t *rp, void *usrbuf, size_t maxlen) {
    int n, rc;
    char c, *bufp = usrbuf;

    for (n = 1; n < maxlen; n++) {
        if ((rc = rio_read(rp, &c, 1)) == 1) {
            *bufp++ = c;
            if (c == '\n') {
                n++;
                break;
            }
        } else if (rc == 0) {
            if (n == 1)
                return 0; /* EOF, no data read */
            else
                break; /* EOF, some data was read */
        } else
            return -1; /* Error */
    }
    *bufp = 0;
    return n - 1;
}
/* copied from csapp end */

int parse_http_line(char *buf, int maxlen, char **keyp, char **valuep) {
    for (int i = 0; i < maxlen && buf[i]; i++) {
        if (buf[i] == ':') {
            buf[i] = 0;
            *keyp = buf;
            *valuep = buf + i + 1;
            return 0;
        }
    }
    return -1;
}

void mkdir_recurively(const char *dir) {
    char tmp[BUFFER_SIZE];
    char *p = NULL;
    size_t len;

    snprintf(tmp, sizeof(tmp), "%s", dir);
    len = strlen(tmp);
    if (tmp[len - 1] == '/')
        tmp[len - 1] = 0;
    for (p = tmp + 1; *p; p++)
        if (*p == '/') {
            *p = 0;
            mkdir(tmp, S_IRWXU);
            *p = '/';
        }
    mkdir(tmp, S_IRWXU);
}

void ensure_dir(char *filename) {
    int len = strlen(filename);
    for (int i = len - 1; i >= 0; i--) {
        if (filename[i] != '/')
            continue;
        filename[i] = 0;
        mkdir_recurively(filename);
        filename[i] = '/';
        break;
    }
}

int download_object(char *host_url, char *name, char *dir) {
    char buf[BUFFER_SIZE], token[BUFFER_SIZE];
    char *keyp, *valuep;
    int name_len, dir_len;
    int clientfd, filefd;
    int http_ret;
    int content_length = 0;
    rio_t rp;
    /* input security check */
    name_len = strlen(name);
    dir_len = strlen(dir);
    ENSURE(dir_len + name_len < BUFFER_SIZE - 1, );
    ENSURE(name_len < BUFFER_SIZE - 17, );
    /* open fd */
    ENSURE((clientfd = open_clientfd(host_url, "80")) >= 0, );
    debug_printf("open clientfd successfully\n");
    /* send request, use HTTP/1.0 so that the data will not be chucked */
    snprintf(buf, sizeof(buf), "GET %s HTTP/1.0\r\n\r\n", name);
    rio_writen(clientfd, buf, strlen(buf));
    debug_printf("send request for %s successfully\n", name);
    /* begin seek data */
    rio_readinitb(&rp, clientfd);
    /* check return status */
    rio_readlineb(&rp, buf, BUFFER_SIZE);
    ENSURE(sscanf(buf, "%s %d", token, &http_ret) == 2, close(clientfd););
    ENSURE(http_ret == 200, close(clientfd););
    debug_printf("get response for %s: %d\n", name, http_ret);
    /* parse header */
    while (rio_readlineb(&rp, buf, BUFFER_SIZE) > 2) {
        /* read until an empty line */
        if (parse_http_line(buf, BUFFER_SIZE, &keyp, &valuep) < 0)
            continue;
        if (strncasecmp(keyp, "Content-Length", BUFFER_SIZE) == 0) {
            content_length = atoi(valuep);
        }
    }
    debug_printf("content length: %d\n", content_length);
    /* there should be some content read back */
    ENSURE(content_length > 0, close(clientfd););
    /* transfer data */
    if (name[name_len - 1] == '/') {
        /* name is dir, that's bad */
        snprintf(buf, sizeof(buf), "%s/%sindex.html", dir, name);
    } else {
        snprintf(buf, sizeof(buf), "%s/%s", dir, name);
    }
    ensure_dir(buf);
    ENSURE((filefd =
                open(buf, O_RDWR | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR)) >= 0,
           close(clientfd));
    debug_printf("open local file %s successfully\n", buf);
    while (content_length) {
        int n = rio_readnb(&rp, buf, BUFFER_SIZE);
        rio_writen(filefd, buf, n);
        content_length -= n;
    }
    debug_printf("finish fetch %s\n", name);
    /* done! close all files */
    close(filefd);
    close(clientfd);
    return 0;
}

void single_thread_download_tag(char *index_content, char *tag, int size,
                                char *host_url, char *dir) {
    char *cp = index_content;
    int tag_len = strlen(tag);
    char *namep;
    while ((cp = strstr(cp, tag)) != NULL) {
        cp += tag_len;
        namep = cp;
        while (*cp && *cp != '"')
            cp++;
        if (!cp)
            break;
        *cp = 0;
        download_object(host_url, namep, dir);
        *cp = '"';
        cp++;
    }
}

void single_thread_download(char *index_content, int size, char *host_url,
                            char *dir) {
    single_thread_download_tag(index_content, "src=\"", size, host_url, dir);
    single_thread_download_tag(index_content, "href=\"", size, host_url, dir);
}

int main(int argc, char **argv) {
    char buf[BUFFER_SIZE];
    char *download_dir = argc > 1 ? argv[1] : DEFAULT_DOWNLOAD_DIR;
    char *url = argc > 2 ? argv[2] : DEFAULT_DOWNLOAD_URL;
    char *index_content;
    struct stat sb;
    int index_fd;
    ENSURE(download_object(url, "/", download_dir) == 0,
           debug_printf("can not fetch index.html\n"));
    snprintf(buf, BUFFER_SIZE, "%s/index.html", download_dir);
    ENSURE((index_fd = open(buf, O_RDONLY)) >= 0, );
    ENSURE(fstat(index_fd, &sb) == 0, close(index_fd));
    index_content =
        mmap(NULL, sb.st_size, PROT_WRITE, MAP_PRIVATE, index_fd, 0);
    ENSURE(index_content != (void *)(-1), close(index_fd));
    single_thread_download(index_content, sb.st_size, url, download_dir);
    close(index_fd);
    munmap(index_content, sb.st_size);
    return 0;
}
