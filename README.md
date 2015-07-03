# docker-apache
Docker化apache

## 镜像特点

- 2015/7/3 继承基础镜像docker-ubuntu

## 使用方法

- 获取代码并构建

        git clone https://github.com/Dockerlover/docker-apache.git
        cd docker-apache
        docker build -t docker-apache .

- 运行容器

        docker run -d -it --name apache -p 8080:80 \
        -v /var/docker_images/docker-apache/app:/app docker-apache
