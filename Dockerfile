FROM ubuntu
RUN  apt update
RUN apt upadate; \
    apt install -y nginx nano wget;\
    mkdir /myapp/
MAINTAINER venkat
WORKDIR ./app
VOLUME testvolume01
CMD ["nginx", "-g", "daemon off;"]
COPY ./* /app/
ADD  https://downloads.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz.asc /app/
EXPOSE 80
