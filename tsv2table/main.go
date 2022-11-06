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

	if header != "auto" && header != "on" && header != "off" {
		fmt.Println("Invalid value for --header=" + header + " Valid values are: auto (default), on, off")
		os.Exit(1)
	}

	var fieldsLength []int
	var lengthSum int
	var tableData [][]string

	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {

		elements := strings.Split(scanner.Text(), "\t")
		tableData = append(tableData, elements)

		if len(fieldsLength) == 0 {
			for _, el := range elements {
				l := utf8.RuneCountInString(el)
				fieldsLength = append(fieldsLength, l)
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

	for _, l := range fieldsLength {
		lengthSum += l
	}

	if err := scanner.Err(); err != nil {
		fmt.Printf("Invalid input: %s", err)
	}

	for i, row := range tableData {
		for j, el := range row {
			fmt.Print(el)
			fmt.Print(strings.Repeat(" ", fieldsLength[j]-utf8.RuneCountInString(el)))
			if j != len(row)-1 {
				fmt.Print(" | ")
			}
		}
		fmt.Println()
		if i == 0 && header == "on" {
			fmt.Println(strings.Repeat("-", lengthSum+3*(len(fieldsLength)-1)))
		}
	}

}
