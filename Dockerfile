FROM ubuntu:trusty
MAINTAINER Mike

RUN apt-get -y update

# install utils programs
RUN apt-get -y -q install \
        build-essential \
        make \
        cmake \
        vim \
        git \
        zip \
        bzip2 \
        fontconfig \
        curl \
        vim \
        software-properties-common

##### PYTHON ####
# install virtualenv
RUN apt-get -y -q install python-setuptools
RUN easy_install pip
RUN pip install virtualenv virtualenvwrapper

#### JAVA8 #####
RUN add-apt-repository ppa:webupd8team/java -y
RUN apt-get -y update
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java8-installer && apt-get clean
RUN update-java-alternatives -s java-8-oracle

#### MAVEN ####
RUN apt-get -y -q install maven

#### NODE v0.12 / NPM ####
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -q --yes nodejs

#### NVM ####
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash
RUN exec bash
RUN nvm install 0.10
RUN nvm install 0.12
RUN nvm install 4
