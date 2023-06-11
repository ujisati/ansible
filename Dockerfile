FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y software-properties-common curl git build-essential sudo cmake
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-add-repository -y ppa:neovim-ppa/stable
RUN apt-get update
RUN apt-get install -y curl git ansible build-essential neovim
RUN apt-get clean autoclean
RUN apt-get autoremove --yes

FROM base AS helm
ARG TAGS
RUN addgroup --gid 1000 harry
RUN adduser --gecos harry --uid 1000 --gid 1000 harry
RUN usermod -a -G sudo harry
RUN echo "root:root" | chpasswd
RUN echo "harry:test" | chpasswd
USER harry
WORKDIR /home/harry

FROM helm
COPY . .
# CMD ["sh", "-c", "ansible-playbook setup.yml"]
