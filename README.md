## Alpine Edge fork of [linuxserver/docker-jackett](https://github.com/linuxserver/docker-jackett/)
[Jackett](https://github.com/Jackett/Jackett) works as a proxy server: it translates queries from apps (Sonarr, SickRage, CouchPotato, Mylar, etc) into tracker-site-specific http queries, parses the html response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping & translation logic - removing the burden from other apps.

[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/repository/docker/vcxpz/jackett) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/jackett?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/auto_build-daily-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-jackett/actions?query=workflow%3A%22Cron+Update+CI%22)

## Version Information
![alpine](https://img.shields.io/badge/alpine-edge-0D597F?style=for-the-badge&logo=alpine-linux) ![s6 overlay](https://img.shields.io/badge/s6_overlay-2.1.0.2-blue?style=for-the-badge) ![jackett](https://img.shields.io/badge/jackett-0.17.197-blue?style=for-the-badge)

## Usage
```
docker run -d \
  --name=jackett \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Australia/Melbourne \
  -e DEBUG=true/false `#optional` \
  -p 9117:9117 \
  -v <path to appdata>:/config \
  -v <path to blackhole>:/downloads \
  --restart unless-stopped \
  vcxpz/jackett
```

## Credits
* [spritsail/jackett](https://github.com/spritsail/jackett) for the [dotnet build snipped](https://github.com/spritsail/jackett/blob/e7c72dc80489210b774fc8ab67666cc4cc03c9d8/Dockerfile#L8-L19) and the `HEALTHCHECK` command
* [hotio](https://github.com/hotio) for the `redirect_cmd` function

## Todo
* Nothing, everything works 🙂
