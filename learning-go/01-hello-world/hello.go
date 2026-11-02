package main

import "fmt"

const (
	spanish = "Spanish"
	french  = "French"

	englishHelloPrefix = "Hello, "
	spanishHelloPrefix = "Hola, "
	frenchHelloPrefix  = "Bonjour, "
)

func Hello(name, language string) string {
	if name == "" {
		name = "world"
	}
	return greetingPrefix(language) + name
}

// Functions:
// - Funciones publicas inician con la letra en mayusculas (capitalize).
// - Funciones privadas inician con la letra en minusculas (lowercase).

// Named Return:
// - Consiste en crear una variable llamada "x" en la funcion, se le asignara el valor "zero"
// correspondiente a su tipo de dato (int -> 0 | string -> "" | bool -> false).
// - Podemos retornar solo llamando a `return` en lugar de `return x`.
func greetingPrefix(language string) (prefix string) {
	switch language {
	case spanish:
		prefix = spanishHelloPrefix
	case french:
		prefix = frenchHelloPrefix
	default:
		prefix = englishHelloPrefix
	}

	return
}

func main() {
	fmt.Println(Hello("world", ""))
}
