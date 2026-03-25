package main

import (
	"fmt"
	"math/rand"
)

func main() {
	const size_nums = 10
	nums := make([]int, 0, size_nums)
	for i := 0; i < size_nums; i++ {
		nums = append(nums, rand.Intn(100))
	}
	fmt.Println(nums)

	for i, num := range nums {
		switch {
		case (num%2 == 0) && (num%3 == 0):
			fmt.Println(i, num, "Six")
		case num%2 == 0:
			fmt.Println(i, num, "Two")
		case num%3 == 0:
			fmt.Println(i, num, "Three")
		default:
			fmt.Println(i, num, "Never mind")
		}
	}
}
