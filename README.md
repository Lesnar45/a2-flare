## Alpine Edge fork of [linuxserver/docker-jackett](https://github.com/linuxserver/docker-jackett/)
[Jackett](https://github.com/Jackett/Jackett) works as a proxy server: it translates queries from apps (Sonarr, SickRage, CouchPotato, Mylar, etc) into tracker-site-specific http queries, parses the html response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping & translation logic - removing the burden from other apps.

[![Docker hub](https://img.shields.io/badge/docker%20hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/repository/docker/vcxpz/jackett) ![Docker Image Size](https://img.shields.io/docker/image-size/vcxpz/jackett?style=for-the-badge&logo=docker) [![Autobuild](https://img.shields.io/badge/auto%20build-weekly-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-jackett/actions?query=workflow%3A%22Docker+Update+CI%22)

## Version Information
![alpine](https://img.shields.io/badge/alpine-edge-0D597F?style=for-the-badge&logo=alpine-linux) ![s6overlay](https://img.shields.io/badge/s6--overlay-2.1.0.2-blue?style=for-the-badge) ![jackett](https://img.shields.io/badge/jackett-0.17.118-blue?style=for-the-badge) [![moredetail](https://img.shields.io/badge/more-detail-blue?style=for-the-badge)](https://github.com/hydazz/docker-jackett/blob/main/package_versions.txt)

## Usage
```
docker run -d \
  --name=jackett \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Australia/Melbourne \
  -e AUTO_UPDATE=true `#optional` \
  -e RUN_OPTS=<run options here> `#optional` \
  -p 9117:9117 \
  -v <path to appdata>:/config \
  -v <path to blackhole>:/downloads \
  --restart unless-stopped \
  vcxpz/jackett
```

## Todo
* Fix `/app/Jackett/jackett: not found` error, likely a dependency error or jackett needs a musl release
