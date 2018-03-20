#!/bin/bash
docker build . -t tmpimage && docker run -it -p 8080:8080 --volume prod_db:/usr/src/app/db --volume data:/usr/src/app/data -e SECRET_KEY_BASE=blah tmpimage
