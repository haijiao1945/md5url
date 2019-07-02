docker stop md5url
docker rm md5url 
docker rmi md5url
docker build -t willmao/md5url .
docker run -itd --name md5url -p 8900:8900 willmao/md5url 