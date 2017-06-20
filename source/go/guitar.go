// imports
package main
import (
    "fmt"
    "os"
    "bufio"
    "strings"
)

// main
func main() {
    discourse := []string{"a", "A", "b", "c", "C", "d", "D", "e", "f", "F", "g", "G"}
    g := guitar{discourse}

    for {
        input  := menu(">")
        action := strings.Split(input, " ")
        g.dispatch(action[0], action[1:])
    }
}

// functions
func rotate(list []string, by int) []string {
    for i := 0; i < by; i++ {
        head := list[0]
        tail := list[1:]
        list  = append(tail, head)
    }
    return list
}
func fret(note string) string {
    return "[" + note + "]-"
}
func line(list []string, by int) string {
    rotated := rotate(list, by)

    var line string
    for _, note := range rotated {
        line = line + fret(note)
    }
    return line
}
func isolate(list []string, filters []string) []string {
    var filtered []string
    element := "_"

    for _, note := range list {
        for _, filter := range filters {
            if note == filter {
                element = note
                break
            }
        }
        filtered = append(filtered, element)
        element = "_"
    }
    return filtered
}
func fretboard(discourse []string, filters []string) {
    fmt.Println(" 0           3       5       7       9")
    fmt.Println(line(isolate(discourse, filters),  7))
    fmt.Println(line(isolate(discourse, filters),  2))
    fmt.Println(line(isolate(discourse, filters), 10))
    fmt.Println(line(isolate(discourse, filters),  5))
    fmt.Println(line(isolate(discourse, filters),  0))
    fmt.Println(line(isolate(discourse, filters),  7))
    fmt.Println(" 0           3       5       7       9")
}
func menu(prompt string) string {
    reader := bufio.NewReader(os.Stdin)
    fmt.Print(prompt + " ")
    text, _ := reader.ReadString('\n')
    return strings.Trim(text, "\n ")
}

// guitar
type guitar struct {
    notes []string
}
func (g *guitar) dispatch(command string, arguments []string) {
    switch command {
    case "fret":
        fretboard(g.notes, g.notes)
    case "scale":
        fretboard(g.notes, arguments)
    case "exit":
        os.Exit(0)
    }
}