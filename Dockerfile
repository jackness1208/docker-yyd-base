FROM ubuntu:18.04
LABEL authors="liudaojie <liudaojie@yy.com>"

# apt 加速
RUN  echo "deb http://archive.ubuntu.com/ubuntu bionic main universe\n" > /etc/apt/sources.list \
  && echo "deb http://archive.ubuntu.com/ubuntu bionic-updates main universe\n" >> /etc/apt/sources.list \
  && echo "deb http://security.ubuntu.com/ubuntu bionic-security main universe\n" >> /etc/apt/sources.list

WORKDIR /root

# apt 基础组件安装
RUN apt-get update
RUN apt-get -qqy upgrade
RUN apt-get -qqy install apt-utils

# 时区包安装
ENV DEBIAN_FRONTEND=noninteractive
ENV TIME_ZONE Asiz/Shanghai
RUN apt-get install -qqy tzdata

# 基础库安装
RUN apt-get -y --no-install-recommends install \
  software-properties-common \
  ca-certificates \
  sudo \
  curl \
  yarn \
  wget \
  vim \
  git \
  zip \
  unzip \
  xz-utils \
  bzip2 \
  apt-transport-https \
  jq \
  libxml-xpath-perl \
  xfonts-100dpi \
  xfonts-75dpi \
  xfonts-scalable \
  xfonts-cyrillic \
  xvfb \
  x11-apps \ 
  libqt5webkit5 \
  libgconf-2-4 \
  gnupg \
  salt-minion \
  imagemagick

# vim 安装
RUN apt-get install vim -y

# vimrc 配置
RUN git clone https://github.com/jackness1208/vimrc.git
RUN cp -rf /root/vimrc/centos/vimrc /etc/vimrc
RUN rm -rf /root/vimrc

# 安装 docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
# RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
RUN apt-get update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io

# 安装 node
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get -y install nodejs

RUN npm i npm@latest -g \
  && npm config set user 0 \
  && npm config set unsafe-perm true