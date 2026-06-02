# poc-devcontainer-base

Environnement de développement conteneurisé pour Python géospatial + PostgreSQL/PostGIS.

## Prérequis

- [Docker](https://www.docker.com/)
- [VS Code](https://code.visualstudio.com/) avec l'extension [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Démarrage rapide

1. Copier le fichier d'environnement :

```bash
cp .devcontainer/.env.template .devcontainer/.env
```

2. Ouvrir le projet dans VS Code et lancer **Reopen in Container**.

Le container démarre avec :
- Python 3.11 + libs géospatiales (GDAL, Shapely, GeoPandas, Fiona, PyProj)
- PostgreSQL 15 + PostGIS 3.4 accessible sur `localhost:5433`
- Les dépendances de `requirements.txt` installées automatiquement

## Ajouter une dépendance

| Dépendance | Fichier | Action |
|---|---|---|
| Package léger (`pandas`, `requests`…) | `requirements.txt` | Reopen in Container |
| Lib géospatiale lourde (GDAL, Shapely…) | `Dockerfile` | Rebuild Container |

## Vérifier l'environnement

```bash
# Lister les packages installés
uv pip list

# Vérifier GDAL
python -c "from osgeo import gdal; print(gdal.VersionInfo())"

# Tester la connexion PostgreSQL
psql -h $POSTGRES_HOST -U $POSTGRES_USER -d $POSTGRES_DB -c "SELECT PostGIS_Version();"
```

## Variables d'environnement

Les credentials PostgreSQL sont définis dans `.devcontainer/.env` (non commité). Voir `.devcontainer/.env.template` pour les variables requises.

## Quand faire un Rebuild Container

| Situation | Action |
|---|---|
| Premier clone du repo | Reopen in Container |
| Modification de `requirements.txt` | Reopen in Container |
| Modification du `Dockerfile` | Rebuild Container |

## Tester une version Python différente

Par défaut, Python 3.11 est utilisé. Pour tester une autre version (ex: 3.12) :

```bash
docker build --build-arg VARIANT=3.12 -t poc-devcontainer-base .devcontainer/docker
```
