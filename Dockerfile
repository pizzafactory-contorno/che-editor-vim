ARG BASE_IMAGE
FROM pizzafactory/che-editor-ttyd:alpine-3.10 as ttyd

ADD entrypoint.sh /usr/bin/

FROM ${BASE_IMAGE}

USER root
RUN apk add --no-cache vim bash git
USER user
COPY --from=ttyd /usr/bin/ttyd /usr/bin/entrypoint.sh /usr/bin/

CMD [ "/usr/bin/ttyd", "-p", "8080", "/usr/bin/entrypoint.sh" ]
