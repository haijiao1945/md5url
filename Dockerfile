FROM golang:latest

RUN mkdir /data
RUN mkdir /data/www
RUN mkdir /data/www/md5url

WORKDIR /data/www/md5url
ADD . /data/www/md5url

RUN go build .

EXPOSE 8900

ENTRYPOINT ["./md5url"]
