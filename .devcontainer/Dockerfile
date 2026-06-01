FROM mcr.microsoft.com/devcontainers/python:3.11

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV TZ=America/Montreal
ENV LANG=en_US.UTF-8

# Libs système : GDAL, PROJ, GEOS, client PostgreSQL
RUN apt-get update && apt-get install -y --no-install-recommends \
    gdal-bin \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libspatialindex-dev \
    libpq-dev \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Installer uv pour gérer les environnements virtuels rapidement
RUN pip install --upgrade pip && pip install uv

WORKDIR /workspace
