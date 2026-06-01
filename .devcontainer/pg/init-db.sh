#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" --port "5432" <<-EOSQL
    CREATE SCHEMA postgis;

    UPDATE pg_extension
      SET extrelocatable = TRUE
        WHERE extname = 'postgis';
    ALTER EXTENSION postgis
      SET SCHEMA postgis;

    DROP SCHEMA IF EXISTS tiger CASCADE;
    DROP SCHEMA IF EXISTS tiger_data CASCADE;
    DROP SCHEMA IF EXISTS topology CASCADE;

    GRANT ALL PRIVILEGES ON SCHEMA postgis TO $POSTGRES_USER;

    CREATE EXTENSION IF NOT EXISTS pgcrypto;

    ALTER ROLE $POSTGRES_USER SET search_path TO public, postgis;
EOSQL
