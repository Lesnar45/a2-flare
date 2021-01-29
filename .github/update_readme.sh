#!/bin/bash

sed -i -E \
	-e "s/jackett-.*?-blue/blue-${APP_VERSION}-blue/g" \
	README.md
