FROM lsiobase/alpine:latest

LABEL maintainer="melsonlai"
ENV TZ="Asia/Taipei" PORT="5299" BAIDUPCS_GO_CONFIG_DIR="/config"

RUN \
  export MY_BAIDUPCS_VER="$(wget -q -O- https://api.github.com/repos/liuzhuoling2011/baidupcs-web/releases/latest | grep tag_name | cut -d : -f 2 | tr -d '\", ')" \
  && echo "Installing BaiduPCS ${MY_BAIDUPCS_VER}... " \
  && apk add --no-cache unzip \
  && cd /tmp \
  && wget -q -O baidupcs.zip https://github.com/liuzhuoling2011/baidupcs-web/releases/download/${MY_BAIDUPCS_VER}/BaiduPCS-Go-${MY_BAIDUPCS_VER}-linux-amd64.zip \
  && mkdir -p /defaults \
  && unzip baidupcs.zip -d /defaults \
  && mv /defaults/BaiduPCS-Go-${MY_BAIDUPCS_VER}-linux-amd64/BaiduPCS-Go /defaults/BaiduPCS-Go \
  && rm -rf /defaults/BaiduPCS-Go-${MY_BAIDUPCS_VER}-linux-amd64 \
  && rm -rf /tmp \
  && echo "Done"

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 5299
VOLUME /downloads /config
