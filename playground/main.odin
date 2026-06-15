package main

Person :: struct {
	name: string,
	age:  int,
}

main :: proc() {
	p1: Person
	p1.age = 12
}
