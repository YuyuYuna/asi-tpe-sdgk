FROM        quay.io/pterodactyl/core:java
LABEL       author="YuyuLuna" maintainer="admin@mail.yuyucloud.com"




RUN apk add tzdata
RUN sudo echo "Asia/Taipei" > /etc/timezone;dpkg-reconfigure -f noninteractive tzdata
RUN echo "Asia/Taipei" >  /etc/timezone
RUN date

USER container
ENV  USER=container HOME=/home/container
ENV TZ Asia/Taipei
RUN apk del tzdata

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
