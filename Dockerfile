# build jackett for musl
FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS dotnet

# environment settings
ARG JACKETT_RELEASE

RUN \
   cd /tmp && \
   wget -O- https://github.com/Jackett/Jackett/archive/${JACKETT_RELEASE}.tar.gz \
      | tar xz --strip-components=1 && \
   cd src && \
   printf '{\n"configProperties": {\n"System.Globalization.Invariant": true\n}\n}' >Jackett.Server/runtimeconfig.template.json && \
   dotnet publish Jackett.Server -f net5.0 --self-contained -c Release -r linux-musl-x64 /p:TrimUnusedDependencies=true /p:PublishTrimmed=true -o /out && \
   echo "**** cleanup ****" && \
   apk --no-cache add \
      binutils && \
   cd /out && \
   rm -f *.pdb && \
   chmod +x jackett && \
   strip -s /out/*.so

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# runtime stage
FROM vcxpz/baseimage-alpine

# set version label
ARG BUILD_DATE
ARG JACKETT_RELEASE
LABEL build_version="Jackett version:- ${JACKETT_RELEASE} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Alex Hyde"

# environment settings
ENV XDG_CONFIG_HOME="/config"

COPY --from=dotnet /out /app/Jackett

RUN \
   echo "**** install runtime packages ****" && \
   apk add --no-cache \
      libcurl \
      libgcc \
      libstdc++ \
      libintl && \
   echo "**** save docker image version ****" && \
   echo "${VERSION}" > /etc/docker-image && \
   echo "**** cleanup ****" && \
   rm -rf \
      /tmp/*

# add local files
COPY root/ /

# jackett healthcheck
HEALTHCHECK --start-period=10s --timeout=5s \
    CMD wget -qO /dev/null 'http://localhost:9117/torznab/all'

# ports and volumes
VOLUME /config
EXPOSE 9117
