FROM lsiobase/alpine:latest

ENV TZ="Asia/Taipei" PORT="5299" VER="3.6.5" BAIDUPCS_GO_CONFIG_DIR="/config"

LABEL baidupcs-go.version="${VER}"
LABEL maintainer="melsonlai"

RUN \
	echo "**** install packages ****" \
	&& apk add --no-cache curl unzip \
	&& cd /tmp \
	&& curl -fSL https://github.com/liuzhuoling2011/baidupcs-web/releases/download/${VER}/BaiduPCS-Go-${VER}-linux-amd64.zip -o baidupcs.zip \
	&& mkdir -p /defaults \
	&& unzip baidupcs.zip -d /defaults \
	&& mv /defaults/BaiduPCS-Go-${VER}-linux-amd64/BaiduPCS-Go /defaults/BaiduPCS-Go \
	&& rm -rf /defaults/BaiduPCS-Go-${VER}-linux-amd64 \
	&& apk del curl \
	&& rm -rf /tmp

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 5299
VOLUME /downloads /config
