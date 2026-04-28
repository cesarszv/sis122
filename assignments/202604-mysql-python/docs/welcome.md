para este proyecto estoy usando `uv`

`uv` sirve para crear el entorno virtual e instalar librerias de python de forma mas rapida que usando solamente `python -m venv` y `pip`.

primero cree el entorno virtual con:

```bash
uv venv
```

esto crea una carpeta "oculta" llamada `.venv`, donde se guardan los archivos del entorno virtual

luego se activa con:

```bash
source .venv/bin/activate
```

y para instalar la libreria que se necesita para conectar python con MySQL use:

```bash
uv pip install mysql-connector-python
```

### por que?

por que en este entorno se van a necesitar librerias como por ej `mysql-connector-python`.

al usar un entorno virtual:

- no "ensuciamos" el sistema entero, ya que instalamos todo solo para el entorno
- evitamos conflictos con librerias de otros proyectos
- PyCharm puede usar este mismo entorno seleccionando `.venv/bin/python` como interprete
