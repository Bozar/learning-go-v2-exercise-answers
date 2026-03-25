package main

import (
	"fmt"
)

func main() {
	greetings := []string{
		"Hello",
		"Hola",
		"你好",
		"こんにちは",
		"Привіт",
	}
	g1 := greetings[:2]
	g2 := greetings[1:4]
	g3 := greetings[3:]

	fmt.Println(greetings)
	fmt.Println(g1)
	fmt.Println(g2)
	fmt.Println(g3)
}
