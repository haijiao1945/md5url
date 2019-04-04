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
RUN go get -v -u github.com/gpmgo/gopm
RUN gopm get -g github.com/gin-contrib/sse
RUN gopm get -g github.com/golang/protobuf/proto
RUN gopm get -g github.com/mattn/go-isatty
RUN gopm get -g github.com/ugorji/go/codec
RUN gopm get -g gopkg.in/go-playground/validator.v8
RUN gopm get -g gopkg.in/yaml.v2

RUN go build .

EXPOSE 8900

ENTRYPOINT ["./md5url"]
