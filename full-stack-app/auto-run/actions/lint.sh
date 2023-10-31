name: Lint Workflow

on: [push]

jobs:
  lint:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Lint Backend
      run: cd ../backend && npm run lint

    - name: Lint Frontend
      run: cd ../frontend && npm run lint
