package main

import "testing"

// Reglas - Escribir un tests
// - Necesita ser escrito en un archivo con nombre como `**_test.go`.
// - El nombre de la funcion debe iniciar con la palabra `Test`.
// - La funcion debe tomar solo 1 argumento `t *testing.T`.
// - Para usar el tipo `*testing.T`, necesitamos `import "testing"`.
func TestHello(t *testing.T) {
	got := Hello("Chris")
	want := "Hello, Chris"

	if got != want {
		t.Errorf("got %q want %q", got, want)
	}
}
