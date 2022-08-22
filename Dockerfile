FROM ubuntu:latest

RUN apt-get update && apt-get -y --no-install-recommends install nodejs git npm

RUN addgroup --gid 1000 node && adduser --uid 1000 --gid 1000 --shell /bin/bash --disabled-password --gecos "" node 

WORKDIR /home/node

COPY init.sh init.sh

RUN chmod 700 init.sh && chown node:node init.sh

USER node

ENV PORT=8081

EXPOSE ${PORT}

ENTRYPOINT ["/bin/bash", "-c", "exec /home/node/init.sh "]