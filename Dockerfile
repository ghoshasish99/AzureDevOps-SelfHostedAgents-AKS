FROM microsoft/vsts-agent

ENV DOCKER_VERSION="18.03.1-ce"

# add docker CLI
RUN curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_VERSION.tgz | \
    tar zxvf - --strip 1 -C /usr/bin docker/docker

WORKDIR /data
COPY ./start.sh .
RUN chmod +x start.sh


WORKDIR /azp
COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
