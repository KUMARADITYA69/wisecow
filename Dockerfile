FROM ubuntu:20.04

####this env is for removing interactive prompts so that while building it does not asks y and n question andchooses default answer as this is necessary for cicd pipeline 
ENV DEBIAN_FRONTEND=noninteractive


ENV PATH="/usr/games:${PATH}"


RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app


COPY wisecow.sh .


RUN chmod +x wisecow.sh


EXPOSE 4499


CMD ["./wisecow.sh"]

