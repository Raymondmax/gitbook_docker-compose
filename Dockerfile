FROM centos:7
RUN yum -y install epel-release && yum makecache && yum -y install httpd python-simplejson npm && \
    mkdir -p /home/gitbook
RUN npm install -g gitbook-cli
RUN mv /etc/localtime /etc/localtime.bak &&\
    ln -s /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
COPY conf/server.py       /usr/local/server.py
WORKDIR /home/gitbook
RUN gitbook init 
RUN gitbook build /home/gitbook /var/www/html
