name: Desencadenar acción en PR hacia develop

on:
  pull_request:
    branches:
      - develop

jobs:
  mi-accion:
    name: Ejecutar acción en PR hacia develop
    runs-on: ubuntu-latest

    steps:
    - name: Clonar repositorio
      uses: actions/checkout@v2

    - name: Ejecutar acción en la PR hacia develop
      run: |
        # Agrega aquí los comandos que deseas ejecutar cuando se abra una PR en develop
        echo "Se ha abierto una PR en la rama develop"
        # Puedes ejecutar comandos, scripts, o cualquier acción necesaria.

