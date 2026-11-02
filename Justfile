# Automatización ergonómica para compilación y pruebas.

set shell := ["bash", "-uc"]

default:
    @just --list

# Compila y ejecuta un archivo C con AddressSanitizer y UndefinedBehaviorSanitizer
run FILE:
    #!/usr/bin/env bash
    set -euo pipefail
    FILE="{{FILE}}"
    if [ ! -f "$FILE" ]; then
        echo "Error: archivo '$FILE' no encontrado."
        exit 1
    fi
    mkdir -p build
    case "$FILE" in
        *.c)
            echo "==> Compilando C con ASan + UBSan..."
            gcc -Wall -Wextra -Werror -pedantic -g -fsanitize=address,undefined "$FILE" -o build/out
            echo "==> Ejecutando build/out..."
            ./build/out
            ;;
        *.go)
            echo "==> Ejecutando Go con -race..."
            go run -race "$FILE"
            ;;
        *.py)
            python3 "$FILE"
            ;;
        *)
            echo "Extensión no soportada por runner: $FILE"
            exit 1
            ;;
    esac

# Ejecuta el archivo y reporta el código de retorno exacto ($?)
test FILE:
    #!/usr/bin/env bash
    # Sin `set -e` a propósito: si `just run` falla debemos capturar su código.
    set -uo pipefail
    FILE="{{FILE}}"
    echo "==> Testeando $FILE..."
    just run "$FILE"
    RET=$?
    echo "==> Código de retorno (exit code): $RET"
    exit $RET

# Comprueba sintaxis/formato en modo rápido sin ejecutar el archivo
check FILE:
    #!/usr/bin/env bash
    set -euo pipefail
    FILE="{{FILE}}"
    if [ ! -f "$FILE" ]; then
        echo "Error: archivo '$FILE' no encontrado."
        exit 1
    fi
    case "$FILE" in
        *.c)
            gcc -fsyntax-only -Wall -Wextra -Werror -pedantic "$FILE"
            echo "✓ Sintaxis correcta en $FILE"
            ;;
        *.go)
            UNFORMATTED=$(gofmt -l "$FILE")
            if [ -n "$UNFORMATTED" ]; then
                echo "✗ Formato incorrecto (ejecuta 'just fmt-go'): $UNFORMATTED"
                exit 1
            fi
            PKG_DIR=$(dirname "$FILE")
            (cd "$PKG_DIR" && go vet .)
            echo "✓ Formato y vet correctos en $FILE"
            ;;
        *.py)
            python3 -m py_compile "$FILE"
            echo "✓ Sintaxis correcta en $FILE"
            ;;
        *)
            echo "Extensión no soportada por check: $FILE"
            exit 1
            ;;
    esac

# Ejecuta todos los tests de learning-go con detector de carreras
test-go:
    #!/usr/bin/env bash
    set -uo pipefail
    cd learning-go
    if [ -z "$(find . -name '*_test.go' -print -quit)" ]; then
        echo "Aún no hay tests en learning-go/. Escribe tu primer *_test.go y vuelve a intentarlo."
        exit 0
    fi
    go test -v -race -count=1 ./...

# Ejecuta todos los tests de learning-dsa con detector de carreras
test-dsa:
    #!/usr/bin/env bash
    set -uo pipefail
    if [ ! -d learning-dsa/go ]; then
        echo "learning-dsa/go/ todavía no existe. DSA arranca el 16 nov 2026."
        exit 0
    fi
    cd learning-dsa/go
    if [ -z "$(find . -name '*_test.go' -print -quit)" ]; then
        echo "Aún no hay tests en learning-dsa/go/. Escribe tu primer *_test.go y vuelve a intentarlo."
        exit 0
    fi
    go test -v -race -count=1 ./...

# Ejecuta los benchmarks de learning-go
bench-go:
    #!/usr/bin/env bash
    set -uo pipefail
    cd learning-go
    if [ -z "$(find . -name '*_test.go' -print -quit)" ]; then
        echo "Aún no hay tests/benchmarks en learning-go/."
        exit 0
    fi
    go test -run '^$' -bench=. -benchmem ./...

# Aplica el formateador oficial de Go sobre learning-go y learning-dsa
fmt-go:
    #!/usr/bin/env bash
    set -euo pipefail
    for dir in learning-go learning-dsa/go; do
        if [ -d "$dir" ]; then
            (cd "$dir" && gofmt -l -w .)
        fi
    done
    echo "✓ gofmt aplicado en learning-go/ y learning-dsa/go/"

# Análisis estático de Go (golangci-lint se añadirá cuando haya código real)
lint-go:
    #!/usr/bin/env bash
    set -uo pipefail
    found=0
    for dir in learning-go learning-dsa/go; do
        if [ -d "$dir" ] && [ -n "$(find "$dir" -name '*.go' -print -quit)" ]; then
            found=1
            (cd "$dir" && go vet ./...)
        fi
    done
    if [ "$found" -eq 0 ]; then
        echo "Aún no hay código Go en learning-go/ ni learning-dsa/go/."
        exit 0
    fi
    echo "✓ go vet sin hallazgos"

# Ejecuta los tests de taskapi (repo independiente en projects/)
test-taskapi:
    #!/usr/bin/env bash
    set -uo pipefail
    if [ ! -d projects/taskapi ]; then
        echo "projects/taskapi/ todavía no existe. Se crea en S2 (9–15 nov)."
        exit 0
    fi
    cd projects/taskapi
    go test -v -race -count=1 ./...

# Compila el proyecto semanal mysh
mysh:
    @make -C projects/mysh

# Limpia los binarios y artefactos de compilación
clean:
    @rm -rf build/ learning-dsa/c/build/ *.out
    @if [ -d projects/mysh ]; then make -C projects/mysh clean 2>/dev/null || true; fi
    @echo "✓ Artefactos de compilación eliminados."
