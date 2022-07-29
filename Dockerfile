FROM alpine

ARG USER=abc
ENV HOME=/home/$USER

RUN apk add ansible \
            terraform \
            openssh-client \
            rsync \
            curl \
            kbd

RUN sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/local/bin

RUN adduser -D $USER

RUN mkdir $HOME/.ssh && \
    chmod 700 $HOME/.ssh && \
    chown $USER:$USER $HOME/.ssh

USER $USER
WORKDIR $HOME
