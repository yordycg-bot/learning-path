package main

import "testing"

// Reglas - Escribir un tests:
// - Necesita ser escrito en un archivo con nombre como `**_test.go`.
// - El nombre de la funcion debe iniciar con la palabra `Test`.
// - La funcion debe tomar solo 1 argumento `t *testing.T`.
// - Para usar el tipo `*testing.T`, necesitamos `import "testing"`.
func TestHello(t *testing.T) {
	// Subtests:
	// Podemos agrupar tests alrededor de un "asunto" para describir diferentes escenarios.
	t.Run("saying hello to people", func(t *testing.T) {
		got := Hello("Chris")
		want := "Hello, Chris"
		assertCorrectMessage(t, got, want)
	})
	t.Run("say 'Hello, world' when an empty string is supplied", func(t *testing.T) {
		got := Hello("")
		want := "Hello, world"
		assertCorrectMessage(t, got, want)
	})
}

// Funcion Auxiliar:
// - Se recomienda que hacepte `testing.TB`, que es una interfaz que cumple para `*testing.T`
// como `*testing.B` (benchmark), asi podemos llamar a la funcion auxiliar desde un test
// o un test de rendimiento.
// - t.Helper() -> le indica al test que este metodo es un helper.
func assertCorrectMessage(t testing.TB, got, want string) {
	t.Helper()
	if got != want {
		t.Errorf("got %q want %q", got, want)
	}
}
