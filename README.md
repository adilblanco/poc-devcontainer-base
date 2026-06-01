## porc-devcontainer-base

Quick setup

1. Create and activate the venv

```bash
uv venv .venv
source .venv/bin/activate
```

2. Install Python dependencies

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

3. Test GDAL from Python

```bash
python -c "from osgeo import gdal; print(gdal.VersionInfo())"
python -c "from osgeo import gdal; print(gdal.__file__)"
```

Deactivate when done:

```bash
deactivate
```
