FROM node:22-alpine

ENV HUGO_VERSION 0.135.0

WORKDIR /usr/local/bin
RUN wget -O- https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz|tar -zx

RUN apk add --update git openssh-client bash git-subtree \
    findutils py-pygments asciidoctor libc6-compat libstdc++ \
    ca-certificates

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
