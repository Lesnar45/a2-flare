# build jackett for musl
FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS builder

# environment settings
ARG JACKETT_RELEASE

RUN set -xe && \
   cd /tmp && \
   wget -O- https://github.com/Jackett/Jackett/archive/v${JACKETT_RELEASE}.tar.gz \
      | tar xz --strip-components=1 && \
   cd src && \
   printf '{\n"configProperties": {\n"System.Globalization.Invariant": true\n}\n}' >Jackett.Server/runtimeconfig.template.json && \
   curl -sSL https://raw.githubusercontent.com/hydazz/scripts/main/docker/build-jackett.sh | bash
   echo "**** cleanup ****" && \
   apk --no-cache add \
      binutils && \
   cd /out && \
   rm -f *.pdb && \
   chmod +x jackett && \
   strip -s /out/*.so && \
   echo "**** done building jackett ****"

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# runtime stage
FROM vcxpz/baseimage-alpine

# set version label
ARG BUILD_DATE
ARG JACKETT_RELEASE
LABEL build_version="Jackett version:- ${JACKETT_RELEASE} Build-date:- ${BUILD_DATE}"
LABEL maintainer="hydaz"

# environment settings
ENV XDG_CONFIG_HOME="/config"

RUN set -xe && \
   echo "**** install runtime packages ****" && \
   apk add --no-cache --upgrade \
      libcurl \
      libgcc \
      libstdc++ \
      libintl && \
   echo "**** cleanup ****" && \
   rm -rf \
      /tmp/*

# copy files from builder
COPY --from=builder /out /app/Jackett

# add local files
COPY root/ /

# jackett healthcheck
HEALTHCHECK --start-period=10s --timeout=5s \
    CMD wget -qO /dev/null 'http://localhost:9117/torznab/all'

# ports and volumes
VOLUME /config
EXPOSE 9117
