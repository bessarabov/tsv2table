package main

import (
	"bufio"
	"flag"
	"fmt"
	"log"
	"os"
	"strings"
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

	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {

		s := strings.Split(scanner.Text(), "\t")
		fmt.Println(strings.Join(s[:], " | "))

	}

	if err := scanner.Err(); err != nil {
		log.Println(err)
	}

}
