FROM alpine:3.12

COPY scripts /scripts

ENV CRONS_LINES "30 6 * * *|15 18 * * *"
ENV FRITZ_IPS "192.168.178.1"
ENV FRITZ_USER "admin"
ENV FRITZ_PW "FritzBoxUserPassword"
ENV LOGGING "true"

RUN apk update && apk add bash curl

ENTRYPOINT "scripts/entrypoint.sh"