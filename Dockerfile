FROM golang:latest

RUN mkdir /usr/local/go/src/github.com
RUN mkdir /usr/local/go/src/github.com/haijiao1945
RUN mkdir /usr/local/go/src/github.com/haijiao1945/md5url

WORKDIR /usr/local/go/src/github.com/haijiao1945/md5url
ADD . /usr/local/go/src/github.com/haijiao1945/md5url

RUN go get github.com/gin-gonic/gin
RUN go get github.com/haijiao1945/fileCache

RUN go build .

EXPOSE 8900

ENTRYPOINT ["./md5url"]
