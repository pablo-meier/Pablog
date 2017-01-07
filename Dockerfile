# Built from the nginx base, baby's first Dockerfile.
# See Makefile for actually _building_ the `build/`
# directory, with the actual blog content.

FROM kyma/docker-nginx
MAINTAINER Pablo Meier <pablo.a.meier@gmail.com>

# Install Vim since I need to debug
RUN apt-get update
RUN apt-get install -y vim

# Copy nginx configs
COPY nginx-sources/nginx.conf /etc/nginx/nginx.conf

# Copy the generated output to the www folder.
COPY build/ /var/www

CMD nginx
