FROM python:3.11-slim-bookworm

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Libs système : GDAL, PROJ, GEOS, client PostgreSQL
RUN apt-get update && apt-get install -y --no-install-recommends \
    gdal-bin \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libspatialindex-dev \
    libpq-dev \
    postgresql-client \
    git \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN echo "parse_git_branch() {" >> ~/.bashrc && \
    echo " git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\\\1)/'" >> ~/.bashrc && \
    echo "}" >> ~/.bashrc && \
    echo "export PS1='\${debian_chroot:+(\$debian_chroot)}\[\\\033[01;32m\]\u@\h\[\\\033[00m\]:\[\\\033[01;34m\]\w\[\\\033[01;31m\]\$(parse_git_branch)\[\\\033[00m\]\$ '" >> ~/.bashrc
   
# Montreal Timezone 
ENV TZ America/Montreal

# GDAL — chemins pour apt-install (Debian standard, différent de /usr/local)
ENV GDAL_DATA=/usr/share/gdal \
    CPLUS_INCLUDE_PATH=/usr/include/gdal \
    C_INCLUDE_PATH=/usr/include/gdal

RUN pip install --upgrade pip && pip install uv

WORKDIR /workspace
