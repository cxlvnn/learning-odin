package main

import "core:fmt"
import "core:math/rand"
import "core:os"
import "core:strconv"
import "core:strings"

main :: proc() {
	random_num := rand.int_range(1, 11)

	outer: for {
		buf: [1024]u8
		fmt.print("enter your guess (from 1 to 10 ): ")
		n, _ := os.read(os.stdin, buf[:])

		input := strings.trim_right(string(buf[:n]), "\r\n")

		num, ok := strconv.parse_int(input)
		if !ok {
			fmt.println("make sure you entered a valid number")
			continue
		}

		for num != random_num {
			if num > random_num {
				fmt.println("too high")
			} else if num < random_num {
				fmt.println("too low")
			}
			break
		}

		if num == random_num {
			fmt.println("you guessed it right, hooray")
			for {
				fmt.print("do you want to play again? (y/n): ")
				c, _ := os.read(os.stdin, buf[:])
				choice := strings.trim_right(string(buf[:c]), "\r\n")
				choice = strings.to_lower(choice)
				switch choice {
				case "y":
					random_num = rand.int_range(1, 11)
					continue outer
				case "n":
					fmt.println("have a good day")
					return
				case:
					fmt.println("invalid input")
					continue
				}
			}
		}
	}
}
