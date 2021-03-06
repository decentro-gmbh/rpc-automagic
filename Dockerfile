####################################################################################
# rpc-automagic Dockerfile for local testing/ development
# @author Benjamin Assadsolimani
#
# BUILD: docker build --rm -f Dockerfile -t rpc-automagic:latest .
# RUN: docker run --rm -it --name rpc-automagic --entrypoint=/bin/bash -v $(pwd):/app -p "127.0.0.1:9126:9229" rpc-automagic:latest
#
####################################################################################

FROM node:10.14-stretch
LABEL maintainer="Benjamin Assadsolimani"
WORKDIR /app

# Mark container as development container by setting NODE_ENV to 'development'
ENV NODE_ENV='development'

# Add bin folder of node_modules to PATH
ENV PATH="/app/node_modules/.bin:${PATH}"

# Keep container alive so that a dev can attach to it with a shell
ENTRYPOINT tail -f /dev/null
