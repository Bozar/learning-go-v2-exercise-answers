package main

import (
	"fmt"
)

func main() {
	type Employee struct {
		firstName string
		lastName  string
		id        int
	}

	e1 := Employee{
		"John",
		"Doe",
		23,
	}

	e2 := Employee{
		id:        42,
		firstName: "Clint",
		lastName:  "Eastwood",
	}

	var e3 Employee
	e3.firstName = "Jennifer"
	e3.lastName = "Hale"
	e3.id = 101

	fmt.Println(e1)
	fmt.Println(e2)
	fmt.Println(e3)
}
