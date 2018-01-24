FROM alpine:3.7

MAINTAINER Tuomas Rinne <torinne@gmail.com>

RUN apk --update add sudo && \
    apk --update add python py-pip openssl openssh ca-certificates zsh git && \
    apk --update add --virtual build-dependencies python-dev libffi-dev openssl-dev build-base && \    
    pip install --upgrade pip cffi

# Install ansible
RUN pip install ansible==2.4.2

# Install ohmyzsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

ENTRYPOINT /bin/zsh

# Delete stuff that is not needed anymore
RUN apk del build-dependencies && \
    rm -rf /var/cache/apk/*

CMD [ "ansible-playbook", "--version" ]
