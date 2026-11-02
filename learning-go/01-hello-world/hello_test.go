package main

import "testing"

// Disciplina TDD:
// 1.- Escribir un test.
// 2.- Hacer que la compilacion pase.
// 3.- Ejecutar el test, ver que falla y comprobar el mensaje de error es significativo.
// 4.- Escribir el codigo suficiente para pasar el test.
// 5.- Refactorizar.

// Proceso TDD:
// - Escribir un test que falle y comprobar que falle, para saber que hemos escrito un test
// relevante para nuestros requisitos y que genera una descripcion de fallo facil de entender.
// - Escribir el codigo minimo para que un test pase, de este modo sabemos que tenemos
// un software que funciona.
// - Refactorizar, siempre debemos respaldarnos con nuestros test, para asi asegurarnos de que
// tenemos codigo bien disenado y con el cual es facil de trabajar.

// Reglas - Escribir un tests:
// - Necesita ser escrito en un archivo con nombre como `**_test.go`.
// - El nombre de la funcion debe iniciar con la palabra `Test`.
// - La funcion debe tomar solo 1 argumento `t *testing.T`.
// - Para usar el tipo `*testing.T`, necesitamos `import "testing"`.
func TestHello(t *testing.T) {
	// Subtests:
	// Podemos agrupar tests alrededor de un "asunto" para describir diferentes escenarios.
	t.Run("saying hello to people", func(t *testing.T) {
		got := Hello("Chris", "")
		want := "Hello, Chris"
		assertCorrectMessage(t, got, want)
	})
	t.Run("say 'Hello, world' when an empty string is supplied", func(t *testing.T) {
		got := Hello("", "")
		want := "Hello, world"
		assertCorrectMessage(t, got, want)
	})
	t.Run("in Spanish", func(t *testing.T) {
		got := Hello("Elodie", "Spanish")
		want := "Hola, Elodie"
		assertCorrectMessage(t, got, want)
	})
	t.Run("in French", func(t *testing.T) {
		got := Hello("Elodie", "French")
		want := "Bonjour, Elodie"
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
