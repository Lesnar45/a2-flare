#!/bin/bash

echo "## docker-jackett

[![docker hub](https://img.shields.io/badge/docker_hub-link-blue?style=for-the-badge&logo=docker)](https://hub.docker.com/r/vcxpz/jackett) ![docker image size](https://img.shields.io/docker/image-size/vcxpz/jackett?style=for-the-badge&logo=docker) [![auto build](https://img.shields.io/badge/docker_builds-automated-blue?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-jackett/actions?query=workflow%3A\"Auto+Builder+CI\") [![codacy branch grade](https://img.shields.io/codacy/grade/2ddd07b48fe346bf85845f4b653fc0fb/main?style=for-the-badge&logo=codacy)](https://app.codacy.com/gh/hydazz/docker-jackett)

Fork of [linuxserver/docker-jackett](https://github.com/linuxserver/docker-jackett/)

[Jackett](https://github.com/Jackett/Jackett) works as a proxy server: it translates queries from apps (Sonarr, SickRage, CouchPotato, Mylar, etc) into tracker-site-specific http queries, parses the html response, then sends results back to the requesting software. This allows for getting recent uploads (like RSS) and performing searches. Jackett is a single repository of maintained indexer scraping & translation logic - removing the burden from other apps.

## Version Information

![alpine](https://img.shields.io/badge/alpine-edge-0D597F?style=for-the-badge&logo=alpine-linux) ![jackett](https://img.shields.io/badge/jackett-${APP_VERSION}-blue?style=for-the-badge)

See [package_versions.txt](package_versions.txt) for a full list of the packages and package versions used in this image

## Usage

    docker run -d \\
      --name=jackett \\
      -e PUID=1000 \\
      -e PGID=1000 \\
      -e TZ=Australia/Melbourne \\
      -e DEBUG=true/false \`#optional\` \\
      -p 9117:9117 \\
      -v <path to appdata>:/config \\
      -v <path to blackhole>:/downloads \\
      --restart unless-stopped \\
      vcxpz/jackett

[![template](https://img.shields.io/badge/unraid_template-ff8c2f?style=for-the-badge&logo=docker?color=d1aa67)](https://github.com/hydazz/docker-templates/blob/main/hydaz/jackett.xml)

## New Environment Variables

### Debug

| Name    | Description                                                                                              | Default Value |
| ------- | -------------------------------------------------------------------------------------------------------- | ------------- |
| \`DEBUG\` | set \`true\` to display errors in the Docker logs. When set to \`false\` the Docker log is completely muted. | \`false\`       |

**See other variables on the official [README](https://github.com/linuxserver/docker-jackett/)**

## Upgrading Jackett

To upgrade, all you have to do is pull the latest Docker image. We automatically check for Jackett updates daily so there may be some delay when an update is released to when the image is updated.

## Credits

-   [spritsail/jackett](https://github.com/spritsail/jackett) for the [dotnet build snipped](https://github.com/spritsail/jackett/blob/e7c72dc80489210b774fc8ab67666cc4cc03c9d8/Dockerfile#L8-L19) and the \`HEALTHCHECK\` command
-   [hotio](https://github.com/hotio) for the \`redirect_cmd\` function" >README.md
