FROM golang:latest

RUN go get -v -u github.com/gpmgo/gopm
RUN gopm get -g github.com/haijiao1945/fileCache
RUN gopm get -g github.com/gin-gonic/gin
RUN gopm get -g github.com/gin-contrib/sse
RUN gopm get -g github.com/golang/protobuf/proto
RUN gopm get -g github.com/mattn/go-isatty
RUN gopm get -g github.com/ugorji/go/codec
RUN gopm get -g gopkg.in/go-playground/validator.v8
RUN gopm get -g gopkg.in/yaml.v2

RUN mkdir /data
RUN mkdir /data/www
RUN mkdir /data/www/md5url
WORKDIR /data/www/md5url
ADD . /data/www/md5url

RUN go build .

EXPOSE 8900

ENTRYPOINT ["./md5url"]
