FROM node:10-buster

# 安装 Apache 和依赖
RUN apt-get update && \
    apt-get install -y apache2 python-simplejson curl && \
    npm config set registry https://registry.npmmirror.com && \
    npm install -g gitbook-cli

# 设置时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 设置工作目录
WORKDIR /home/gitbook

# 拷贝 GitBook 源文件（请确保宿主机中有 book/ 目录）
COPY ./book/ /home/gitbook/

# 安装插件并构建 GitBook（使用 || true 可忽略插件缺失报错）
RUN gitbook install || true && gitbook build /home/gitbook /var/www/html || true

# 暴露端口
#EXPOSE 80

# 启动 Apache
#CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
