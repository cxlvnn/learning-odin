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

	first_num, ok := strconv.parse_f64(num1)
	if !ok {
		fmt.println("Make sure you entered a proper number")
		return
	}

	fmt.print("Enter the second number: ")
	n2, _ := os.read(os.stdin, buf[:])
	num2 := strings.trim_right(string(buf[:n2]), "\r\n")

	second_num, fine := strconv.parse_f64(num2)
	if !fine {
		fmt.println("Make sure you entered a proper number")
		return
	}

	for {
		fmt.println("What operation you want to perform?")
		fmt.println("1. Addition")
		fmt.println("2. Subtraction")
		fmt.println("3. Multiplication")
		fmt.println("4. Division")
		fmt.println("5. Quit the program")
		fmt.print(": ")
		o, _ := os.read(os.stdin, buf[:])
		operation := strings.trim_right(string(buf[:o]), "\r\n")

		switch operation {
		case "1":
			add(first_num, second_num)
			return
		case "2":
			subtraction(first_num, second_num)
			return
		case "3":
			multiplication(first_num, second_num)
			return
		case "4":
			division(first_num, second_num)
			return
		case "5":
			fmt.println("Have a good day")
			return
		case:
			fmt.println("No idea what you're doing")
			continue
		}
	}
}

add :: proc(x: f64, y: f64) {
	fmt.println("The addition of", x, "and", y, "is:", x + y)
}

subtraction :: proc(x: f64, y: f64) {
	fmt.println("The subtraction of", x, "and", y, "is:", x - y)
}

multiplication :: proc(x: f64, y: f64) {
	fmt.println("The multiplication of", x, "and", y, "is:", x * y)
}

division :: proc(x: f64, y: f64) {
	if y == 0 {
		fmt.println("Division by zero detected. Exitting the program")
		return
	}
	fmt.println("The division of", x, "by", y, "is:", x / y)
}
