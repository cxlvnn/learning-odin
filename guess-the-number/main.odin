package main

import "core:fmt"
import "core:math/rand"
import "core:os"
import "core:strconv"
import "core:strings"

main :: proc() {
	rand := rand.int_range(1, 11)

	buf: [1024]u8
	fmt.print("enter your guess (from 1 to 10 ): ")
	n, _ := os.read(os.stdin, buf[:])

	input := strings.trim_right(string(buf[:n]), "\r\n")

	num, ok := strconv.parse_int(input)
	if !ok {
		fmt.println("make sure you entered a valid number")
		return
	}

	fmt.println("your guess:", num)
	fmt.println("random number:", rand)
}
