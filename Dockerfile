FROM ubuntu:bionic

LABEL mantainer="maurizio.moreo@gmail.com"

RUN apt-get update && apt-get -y upgrade

# OpenJDK 8 (OpenJFX compatible with sqldeveloper)
RUN apt-get install -y \
    openjdk-8-jdk \
    libopenjfx-java=8u161-b12-1ubuntu2 \
    libopenjfx-jni=8u161-b12-1ubuntu2 \
    openjfx=8u161-b12-1ubuntu2
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

# Oracle SQL Developer
ENV TNS_ADMIN /opt/sqldeveloper/tnsadmin
COPY sqldeveloper/zip/sqldeveloper.zip /opt
RUN apt-get install unzip && \
    unzip /opt/sqldeveloper.zip -d /opt && \
    rm /opt/sqldeveloper.zip && \
    mkdir ${TNS_ADMIN}
COPY sqldeveloper/tnsadmin/tnsnames.ora ${TNS_ADMIN}

# Google Chrome
ARG APP_LINK_CHROME
RUN apt-get install -y \
    libcanberra-gtk* \
    fonts-liberation \
    libappindicator3-1 \
    libxss1 \
    lsb-release \
    xdg-utils \
    wget && \
    wget -O chrome.deb ${APP_LINK_CHROME} && \
    dpkg -i chrome.deb && \
    rm chrome.deb

# GitKraken
ARG APP_LINK_GITKRAKEN
RUN apt-get update && apt-get install -y \
    gconf2 \
    gconf-service \
    libnotify4 \
    libxkbfile1 \
    gvfs-bin && \
    wget -O gitkraken.deb ${APP_LINK_GITKRAKEN} && \
    dpkg -i gitkraken.deb && \
    rm gitkraken.deb

# PhpStorm
ARG APP_LINK_PHPSTORM
RUN wget -O /opt/PhpStorm.tar.gz ${APP_LINK_PHPSTORM} && \
    tar xfz /opt/PhpStorm.tar.gz -C /opt && \
    rm /opt/PhpStorm.tar.gz && \
    mv /opt/PhpStorm* /opt/phpstorm

# IntelliJ IDEA
ARG APP_LINK_INTELLIJ_IDEA
RUN wget -O /opt/IntelliJ.tar.gz ${APP_LINK_INTELLIJ_IDEA} && \
    tar xf /opt/IntelliJ.tar.gz -C /opt && \
    rm /opt/IntelliJ.tar.gz && \
    mv /opt/idea-* /opt/intelliJidea

# Skipper ORM Designer
ARG APP_LINK_SKIPPER
RUN wget -O /opt/skipper.zip ${APP_LINK_SKIPPER} && \
    unzip /opt/skipper.zip -d /opt/skipper && \
    rm /opt/skipper.zip

# Docker
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    lxc \
    iptables && \
    curl -L \
    "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    curl -L \
    https://raw.githubusercontent.com/docker/compose/1.24.0/contrib/completion/bash/docker-compose \
    -o /etc/bash_completion.d/docker-compose
COPY docker/daemon.json /etc/docker/daemon.json

# Insomnia REST client
RUN echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
    | tee -a /etc/apt/sources.list.d/insomnia.list && \
    wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
    | apt-key add - && \
    apt-get update && apt-get install -y insomnia

# OpenSSH, GIT, PulseAudio, Openconnect, sudo
RUN apt-get install -y \
    openssh-client \
    git-core \
    pulseaudio-utils \
    openconnect \
    sudo

# OpenShift oc Client Tools
ARG APP_LINK_OC
RUN wget -O /opt/oc.tar.gz ${APP_LINK_OC} && \
    tar xf /opt/oc.tar.gz -C /opt && \
    rm /opt/oc.tar.gz && \
    mv /opt/openshift-* /opt/oc
ENV PATH "$PATH:/opt/oc"

# Completions
RUN apt-get install bash-completion && \
    /bin/bash -c "source /usr/share/bash-completion/completions/git" && \
    /bin/bash -c "source /usr/share/bash-completion/completions/docker" && \
    /bin/bash -c "source /etc/bash_completion.d/docker-compose" && \
    /opt/oc/oc completion bash >>/etc/bash_completion.d/oc_completion

# User configuration
ARG DISABLE_USER_CACHE
ARG DEVELOPER_TIMEZONE
ARG DEVELOPER_USER
ARG DEVELOPER_GROUP
ARG DEVELOPER_UID
ARG DEVELOPER_GID
COPY config/* /opt/devmachine/
RUN groupadd --gid ${DEVELOPER_GID} ${DEVELOPER_GROUP} && \
    useradd \
    --uid ${DEVELOPER_UID} \
    --gid ${DEVELOPER_GID} \
    --groups ${DEVELOPER_GROUP},docker \
    --base-dir /home \
    --create-home \
    ${DEVELOPER_USER} && \
    echo "${DEVELOPER_USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${DEVELOPER_USER} && \
    chmod 0440 /etc/sudoers.d/${DEVELOPER_USER} && \
    echo "${DEVELOPER_TIMEZONE}" > /etc/timezone && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
    chown -R ${DEVELOPER_USER}:${DEVELOPER_GROUP} /opt/phpstorm

WORKDIR /home/${DEVELOPER_USER}

USER ${DEVELOPER_USER}

ENTRYPOINT sudo dockerd
