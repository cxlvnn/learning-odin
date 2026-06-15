package main

import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"

MAX_TITLE :: 100
MAX_TODOS :: 50

Todo :: struct {
	title: string,
}

TodoList :: struct {
	items: [MAX_TODOS]Todo,
	count: int,
}

main :: proc() {
	list: TodoList
	list.count = 0

	for {
		fmt.println("What do you want to do ?")
		fmt.println("1 - Add a task")
		fmt.println("2 - List all tasks")
		fmt.println("3 - Remove a task")
		fmt.println("4 - Clean tasks list")
		fmt.println("5 - Quit the program")
		fmt.print(": ")
		buf: [1024]u8
		input, _ := os.read(os.stdin, buf[:])
		input_text := strings.trim_right(string(buf[:input]), "\r\n")

		operation, ok := strconv.parse_int(input_text)
		if !ok {
			fmt.println("Make sure you entered a valid number")
		}

		switch operation {
		case 1:
			fmt.print("Enter the task title: ")
			i, _ := os.read(os.stdin, buf[:])
			title := strings.trim_right(string(buf[:i]), "\r\n")
			fmt.println(add_task(&list, title))
		case 2:
			list_tasks(&list)
			break
		case 5:
			fmt.println("Have a good day")
			return
		}

	}
}

add_task :: proc(list: ^TodoList, title: string) -> string {
	if list.count >= MAX_TODOS {return "Limit for tasks exceeded"}
	list.items[list.count].title = title
	list.count += 1

	return list.items[list.count].title
}

list_tasks :: proc(list: ^TodoList) {
	fmt.println(list.items[list.count].title)
}
