package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"

main :: proc() {


	fmt.print("Enter the first number: ")
	buf: [1024]u8
	n, _ := os.read(os.stdin, buf[:])
	num1 := strings.trim_right(string(buf[:n]), "\r\n")

	first_num, ok := strconv.parse_int(num1)
	if !ok {
		fmt.println("Make sure you entered a proper number")
		return
	}

	fmt.print("Enter the second number: ")
	n2, _ := os.read(os.stdin, buf[:])
	num2 := strings.trim_right(string(buf[:n]), "\r\n")

	second_num, fine := strconv.parse_int(num2)
	if !fine {
		fmt.println("Make sure you entered a proper number")
		return
	}

	fmt.println("What operation you want to perform?")
	fmt.println("1. Addition")
	fmt.println("2. Subtraction")
	fmt.println("3. Multiplication")
	fmt.println("4. Division")
	fmt.print(": ")
	o, _ := os.read(os.stdin, buf[:])
  operation := strings.trim_right(string(buf[:n]), "\r\n") 

	switch operation {
	case "1":
		fmt.println(
			"The addition of",
			first_num,
			"and",
			second_num,
			"is:",
			add(first_num, second_num),
		)
	}
}

add :: proc(x: int, y: int) -> int {
	return x + y
}
