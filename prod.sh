#!/bin/bash
docker build . -t tmpimage && docker run -it -p 8080:8080 --volume prod_db:/usr/src/app/db -e SECRET_KEY_BASE=blah tmpimage
