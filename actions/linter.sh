name: GitHub Super Linter

on:
  push:
    branches:
      - main # Puedes cambiar la rama según tus necesidades

jobs:
  lint:
    name: Lint de código
    runs-on: ubuntu-latest

    steps:
    - name: Checkout del código
      uses: actions/checkout@v2

    - name: GitHub Super Linter
      uses: github/super-linter@v5
      env:
        VALIDATE_ALL_CODEBASE: "true"
        DEFAULT_BRANCH: "main" # Puedes cambiar la rama predeterminada según tus necesidades
