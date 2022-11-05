package main

import (
	"bufio"
	"flag"
	"fmt"
	"os"
	"strings"
	"unicode/utf8"
)

func main() {

	var help bool
	var header string

	flag.BoolVar(&help, "help", false, "usage")
	flag.StringVar(&header, "header", "auto", "usage")

	flag.Parse()

	if help {
		fmt.Println("help")
		os.Exit(1)
	}

	var fieldsLength []int
	var tableData [][]string

	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {

		elements := strings.Split(scanner.Text(), "\t")
		tableData = append(tableData, elements)

		if len(fieldsLength) == 0 {
			for _, el := range elements {
				fieldsLength = append(fieldsLength, utf8.RuneCountInString(el))
			}
		} else {
			for i, el := range elements {
				c := utf8.RuneCountInString(el)
				if c > fieldsLength[i] {
					fieldsLength[i] = c
				}
			}
		}

	}

	if err := scanner.Err(); err != nil {
		fmt.Printf("Invalid input: %s", err)
	}

	for _, row := range tableData {
		for i, el := range row {
			fmt.Print(el)
			fmt.Print(strings.Repeat(" ", fieldsLength[i]-utf8.RuneCountInString(el)))
			if i != len(row)-1 {
				fmt.Print(" | ")
			}
		}
		fmt.Println()
	}

}
