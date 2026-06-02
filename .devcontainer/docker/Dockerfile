ARG VARIANT="3.11"
FROM mcr.microsoft.com/devcontainers/python:${VARIANT}

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV TZ=America/Montreal
ENV LANG=en_US.UTF-8
ENV UV_LINK_MODE=copy

RUN apt-get update && apt-get install -y --no-install-recommends \
    gdal-bin \
    libgdal-dev \
    libgeos-dev \
    libproj-dev \
    libspatialindex-dev \
    libpq-dev \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip uv

RUN uv pip install --system \
    shapely pyproj fiona geopandas psycopg2 sqlalchemy \
    && uv pip install --system "gdal==$(gdal-config --version)"

WORKDIR /workspace
