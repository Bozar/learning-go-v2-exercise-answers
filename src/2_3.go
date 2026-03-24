package main

import (
	"fmt"
)

func main() {
	var b byte = 255
	var smallI int32 = 2147483647
	var bigI int64 = 9223372036854775807
	fmt.Println("Max | b:", b, "| smallI:", smallI, "| bigI", bigI)
	fmt.Println("Max+1 | b:", b+1, "| smallI:", smallI+1, "| bigI", bigI+1)
}
