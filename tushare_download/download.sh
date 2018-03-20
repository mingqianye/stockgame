#!/bin/bash
docker build . -t tmpimg && docker run -it --rm -v $(pwd)/data:/usr/src/app/data tmpimg
