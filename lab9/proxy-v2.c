/*
 * proxy.c - ICS Web proxy
 *
 * name: Tong Chuyan
 * id: 520021910934
 *
 */

#include "csapp.h"
#include <stdarg.h>
#include <sys/select.h>

/*
 * Function prototypes
 */
int parse_uri(char *uri, char *target_addr, char *path, char *port);
void format_log_entry(char *logstring, struct sockaddr_in *sockaddr, char *uri, size_t size);

/*
 * rio_writen wrapper without error checking
 */
ssize_t Rio_writen_w(int fd, void *usrbuf, size_t expectsize) {
    ssize_t n;

    if ((n = rio_writen(fd, usrbuf, expectsize)) != expectsize)
        return 0;
    return n;
}

/*
 * rio_readn wrapper without error checking
 */
ssize_t Rio_readnb_w(rio_t *rp, void *usrbuf, size_t maxsize) {
    ssize_t n;

    if ((n = rio_readnb(rp, usrbuf, maxsize)) < 0)
        return 0;
    return n;
}

/*
 * rio_readlineb wrapper without error checking
 */
ssize_t Rio_readlineb_w(rio_t *rp, void *usrbuf, size_t maxsize) {
    ssize_t n;

    if ((n = rio_readlineb(rp, usrbuf, maxsize)) < 0)
        return 0;
    return n;
}

/*
 * proxy thread
 */
void *doit(void *vargp) {
    /* detach thread */
    Pthread_detach(pthread_self());

    /* parse arguments from vargp */
    int clientfd = *(int *)vargp;
    struct sockaddr_in *clientaddr = (struct sockaddr_in *)(vargp + sizeof(int));

    /* local variables */
    int serverfd;
    ssize_t size, body_n, n;
    rio_t rio_clt, rio_svr;
    char buf[MAXBUF << 2], buf_clt[MAXBUF << 1];
    char method[MAXLINE], uri[MAXLINE], version[MAXLINE];
    char hostname[MAXLINE], pathname[MAXLINE], port[MAXLINE];
    char logstring[MAXLINE];

/* macro for error-handling (only add printf during debugging) */
#define ERROR_HANDLER(msg) Close(clientfd); Free(vargp); return NULL;
#define ERROR_HANDLER_FULL(msg) Close(serverfd); ERROR_HANDLER((msg))

    /* get http request from client */
    Rio_readinitb(&rio_clt, clientfd);
    while ((n = Rio_readlineb(&rio_clt, buf_clt, MAXLINE)) <= 0) {
        ERROR_HANDLER("request error\n")
    }
    
    /* parse request line */
    if (sscanf(buf_clt, "%s %s %s", method, uri, version) != 3) {
        ERROR_HANDLER("request line error\n")
    }

    /* parse uri */
    if (parse_uri(uri, hostname, pathname, port) == -1) {
        ERROR_HANDLER("parse uri error\n")
    }

    /* connect to server */
    if ((serverfd = Open_clientfd(hostname, port)) == -1) {
        ERROR_HANDLER("failed to connect to server\n")
    }


    /**********************Forward*************************/
    /* parse request line */
    sprintf(buf, "%s /%s %s\r\n", method, pathname, version);

    /* parse request header */
    body_n = 0;
    do {
        size = strlen(buf);
        if ((n = Rio_readlineb_w(&rio_clt, buf_clt, MAXLINE)) <= 0) {
            ERROR_HANDLER_FULL("client header error\n")
        }
        strncat(buf, buf_clt, n);
        buf[n + size] = '\0';
 
        /* parse requset body size */
        if (strncasecmp(buf_clt, "Content-Length:", 15) == 0)
            body_n = strtol(buf_clt + 16, NULL, 10);
    } while (strcmp(buf_clt, "\r\n") != 0);

    /* parse request body */
    if (body_n > 0) {
        if (Rio_readnb_w(&rio_clt, buf_clt, body_n) != body_n) {
            ERROR_HANDLER_FULL("read resquest body error\n")
        }
    }

    /* post request header to server */
    n = strlen(buf);
    if (Rio_writen_w(serverfd, buf, n) != n) {
        ERROR_HANDLER_FULL("forward request body error\n")
    }

    /* post header to server */
    if (body_n > 0) {
        if (Rio_writen_w(serverfd, buf_clt, body_n) != body_n) {
            ERROR_HANDLER_FULL("forward request body error\n")
        }
    }
    /*******************End of forward********************/


    /**********************Backword*************************/
    /* parse and backward reponse header */
    Rio_readinitb(&rio_svr, serverfd);
    size = 0;
    do {
        if ((n = Rio_readlineb_w(&rio_svr, buf, MAXLINE)) <= 0) {
            ERROR_HANDLER_FULL("read response header error\n")
        }
        if (Rio_writen_w(clientfd, buf, n) <= 0) {
            ERROR_HANDLER_FULL("backword reponse header error\n")
        }
        size += n;

        /* parse response body size */
        if (strncasecmp(buf, "Content-Length:", 15) == 0)
            body_n = strtol(buf + 16, NULL, 10);
    } while (strcmp(buf, "\r\n") != 0);

    /* parse and backward response body */
    size += body_n;
    while (body_n > 0) {
        /* read 1 byte only */
        if (Rio_readnb_w(&rio_svr, buf, 1) <= 0) {
            ERROR_HANDLER_FULL("read response body error\n")
        }

        /* post to client immidiately */
        if (Rio_writen_w(clientfd, buf, 1) <= 0) {
            ERROR_HANDLER_FULL("backward response body error\n")
        }
        body_n--;
    }
    /*******************End of backward********************/


    /* print log, close fd and return */
    format_log_entry(logstring, clientaddr, uri, size);
    printf("%s\n", logstring);
    Close(clientfd);
    Close(serverfd);
    Free(vargp);
    return NULL;
}


/*
 * main - Main routine for the proxy program
 */
int main(int argc, char **argv)
{
    /* Check arguments */
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <port number>\n", argv[0]);
        exit(0);
    }

    /* ignore sigpipe */
    Signal(SIGPIPE, SIG_IGN);

    /* variables */
    socklen_t clientlen = sizeof(struct sockaddr_storage);
    char client_hostname[MAXLINE], client_port[MAXLINE];
    pthread_t tid;
    void *vargp;
    int listenfd;

    listenfd = Open_listenfd(argv[1]);
    while (1) {
        /* wait for client */
        vargp = (void *)Malloc(sizeof(int) + clientlen);
        *(int *)vargp = Accept(listenfd, (SA *)(vargp + sizeof(int)), &clientlen);
        Getnameinfo((SA *)(vargp + sizeof(int)), clientlen, client_hostname, MAXLINE,
                    client_port, MAXLINE, 0);

        /* raise a new thread */
        Pthread_create(&tid, NULL, doit, vargp);
    }

    exit(0);
}


/*
 * parse_uri - URI parser
 *
 * Given a URI from an HTTP proxy GET request (i.e., a URL), extract
 * the host name, path name, and port.  The memory for hostname and
 * pathname must already be allocated and should be at least MAXLINE
 * bytes. Return -1 if there are any problems.
 */
int parse_uri(char *uri, char *hostname, char *pathname, char *port)
{
    char *hostbegin;
    char *hostend;
    char *pathbegin;
    int len;

    if (strncasecmp(uri, "http://", 7) != 0) {
        hostname[0] = '\0';
        return -1;
    }

    /* Extract the host name */
    hostbegin = uri + 7;
    hostend = strpbrk(hostbegin, " :/\r\n\0");
    if (hostend == NULL)
        return -1;
    len = hostend - hostbegin;
    strncpy(hostname, hostbegin, len);
    hostname[len] = '\0';

    /* Extract the port number */
    if (*hostend == ':') {
        char *p = hostend + 1;
        while (isdigit(*p))
            *port++ = *p++;
        *port = '\0';
    } else {
        strcpy(port, "80");
    }

    /* Extract the path */
    pathbegin = strchr(hostbegin, '/');
    if (pathbegin == NULL) {
        pathname[0] = '\0';
    }
    else {
        pathbegin++;
        strcpy(pathname, pathbegin);
    }

    return 0;
}

/*
 * format_log_entry - Create a formatted log entry in logstring.
 *
 * The inputs are the socket address of the requesting client
 * (sockaddr), the URI from the request (uri), the number of bytes
 * from the server (size).
 */
void format_log_entry(char *logstring, struct sockaddr_in *sockaddr,
                      char *uri, size_t size)
{
    time_t now;
    char time_str[MAXLINE];
    char host[INET_ADDRSTRLEN];

    /* Get a formatted time string */
    now = time(NULL);
    strftime(time_str, MAXLINE, "%a %d %b %Y %H:%M:%S %Z", localtime(&now));

    if (inet_ntop(AF_INET, &sockaddr->sin_addr, host, sizeof(host)) == NULL)
        unix_error("Convert sockaddr_in to string representation failed\n");

    /* Return the formatted log entry string */
    sprintf(logstring, "%s: %s %s %zu", time_str, host, uri, size);
}
