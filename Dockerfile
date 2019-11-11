FROM ubuntu:18.04


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
        build-essential \
        python3-dev \
        python3-pip \
        python3-wheel \
        python3-setuptools \
        libjpeg8-dev \
        zlib1g-dev \
        libtiff5-dev \
        libfreetype6-dev \
        fonts-takao \
        fonts-vlgothic \
        texlive-full \
        plantuml \
        python3-sphinx \
    && pip3 install \
        sphinx_rtd_theme \
        sphinx-autobuild \
        reportlab \
        sphinxcontrib-blockdiag \
        sphinxcontrib-seqdiag \
        sphinxcontrib-actdiag \
        sphinxcontrib-nwdiag \
        sphinxcontrib-plantuml \
        recommonmark \
     && rm -rf /var/lib/apt/lists/*

EXPOSE 8000

WORKDIR /workdir


