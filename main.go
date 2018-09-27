package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Println("Hello world!")
	defer fmt.Println("Goodbye world!")
	time.Sleep(time.Minute)
}
