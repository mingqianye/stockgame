#!/bin/bash
docker build . -t tmpimage && docker run -it -p 8080:8080 --volume $(pwd)/prod_db/:/db --volume $(pwd)/data:/data -e SECRET_KEY_BASE=blah tmpimage
