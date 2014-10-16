package main

import (
	"bufio"
	"encoding/json"
	"log"
	"os"
)

type Payload struct {
	A []int `json:"a"`
}

func main() {

	stdin := bufio.NewReader(os.Stdin)
	stdout := bufio.NewWriter(os.Stdout)
	defer stdout.Flush()

	for dec, enc := json.NewDecoder(stdin), json.NewEncoder(stdout); ; {

		var p Payload
		if err := dec.Decode(&p); err != nil {
			log.Fatal(err)
		}
		if err := enc.Encode(&p); err != nil {
			log.Fatal(err)
		}

	}

}
