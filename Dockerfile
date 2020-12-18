FROM vcxpz/baseimage-alpine

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Fork of Linuxserver.io version: ${VERSION} Build-date: ${BUILD_DATE}"
LABEL maintainer="hydaz"

# environment settings
ARG JACKETT_RELEASE
ENV XDG_DATA_HOME="/config" \
XDG_CONFIG_HOME="/config"

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache \
	curl \
	icu-libs \
     krb5-libs \
     libintl \
     libssl1.1 \
     libstdc++ \
     lttng-ust \
     numactl \
     zlib && \
 echo "**** install jackett ****" && \
 mkdir -p \
	/app/Jackett && \
 curl -o \
 /tmp/jacket.tar.gz -L \
	"https://github.com/Jackett/Jackett/releases/download/${JACKETT_RELEASE}/Jackett.Binaries.LinuxAMDx64.tar.gz" && \
 tar xf \
 /tmp/jacket.tar.gz -C \
	/app/Jackett --strip-components=1 && \
 echo "**** fix for host id mapping error ****" && \
 chown -R root:root /app/Jackett && \
 echo "**** save docker image version ****" && \
 echo "${VERSION}" > /etc/docker-image && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/*

# add local files
COPY root/ /

# ports and volumes
VOLUME /config
EXPOSE 9117
