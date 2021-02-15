FROM        quay.io/pterodactyl/core:java
LABEL       author="YuyuLuna" maintainer="admin@mail.yuyucloud.com"

RUN echo "Asia/Taipei" > /etc/timezone;dpkg-reconfigure -f noninteractive tzdata

USER container
ENV  USER=container HOME=/home/container
ENV TZ Asia/Taipei

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
