# 基础镜像
FROM docker-ubuntu
# 维护人员
MAINTAINER  liuhong1.happy@163.com
# 添加环境变量
ENV USER_NAME admin
ENV SERVICE_ID apache
# 安装apache
RUN apt-get update && apt-get -y install apache2 && rm -rf /var/lib/apt/lists/* 
# 配置相关环境
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
ENV ALLOW_OVERRIDE **False**
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html
# 添加启动脚本
ADD start.sh /start.sh
RUN chmod +x *.sh
# 默认暴露80端口
EXPOSE 80
# 映射代码、日志目录等的数据卷
VOLUME ["/app","/usr/local/apache2/logs"]
# 配置supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
# 启动supervisord
CMD ["/usr/bin/supervisord"]
