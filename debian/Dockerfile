FROM ubuntu:bionic

LABEL maintainer="marcin.lipa@protonmail.com"

RUN apt-get update && apt-get install --yes \
    build-essential \
    debhelper \
    devscripts \
    equivs \
    python3-dev \
    software-properties-common

ADD ./debian/control /tmp/pants-debian/debian/control

RUN mk-build-deps --install /tmp/pants-debian/debian/control --tool "apt-get --allow-downgrades --yes"

WORKDIR /tmp/pants-debian

ADD . /tmp/pants-debian

CMD ["dpkg-buildpackage", "-us", "-uc", "-b", "--buildinfo-option=-udebian/dist/", "--changes-option=-udebian/dist/"]
