export PATH := "./.venv/bin:" + env_var('PATH')

example ARG:
    go run {{ARG}}

run:
    go run main.go

bootstrap:
    pdm install

check:
    pyright

test:
    echo No unit tests yet

test-full: bootstrap check test
    #!/usr/bin/env bash -euxo pipefail
    for file in $(ls examples); do
        python3 "examples/$file"
    done

publish:
   FLIT_USERNAME="__token__" \
   FLIT_PASSWORD=$PYPI_API_TOKEN \
   flit publish