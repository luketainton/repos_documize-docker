FROM alpine:3.23.2
LABEL maintainer="Luke Tainton <luke@tainton.uk>"
LABEL org.opencontainers.image.source="https://git.tainton.uk/repos/documize-docker"
ARG DOCUMIZE_VERSION=v5.14.0
ENV DOCUMIZEPORT=5001
RUN apk add --no-cache curl=8.17.0-r1
WORKDIR /opt
RUN curl -L -o documize "https://github.com/documize/community/releases/download/${DOCUMIZE_VERSION}/documize-community-linux-amd64" && chmod 755 documize
ENTRYPOINT ["./documize -port ${DOCUMIZEPORT}"]
EXPOSE ${DOCUMIZEPORT}
