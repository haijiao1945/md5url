FROM golang:latest

RUN mkdir /usr/local/go/src/github.com
RUN mkdir /usr/local/go/src/github.com/haijiao1945
RUN mkdir /usr/local/go/src/github.com/haijiao1945/md5url
RUN mkdir /usr/local/go/src/github.com/gin-gonic

WORKDIR /usr/local/go/src/github.com/haijiao1945
RUN git clone https://github.com/haijiao1945/fileCache.git
WORKDIR /usr/local/go/src/github.com/gin-gonic
RUN git clone https://github.com/gin-gonic/gin.git

WORKDIR /usr/local/go/src/github.com/haijiao1945/md5url
ADD . /usr/local/go/src/github.com/haijiao1945/md5url

RUN go build .

EXPOSE 8900

ENTRYPOINT ["./md5url"]
