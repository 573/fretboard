// imports
import Foundation

// functions
func rotate(list: [String], by: Int) -> [String] {
    var rotated = list
    for _ in 0..<by {
        let head = rotated[0]
        let tail = rotated[1..<list.endIndex]
        rotated = tail + [head]
    }
    return rotated
}
func fret(note: String) -> String {
    return "[" + note + "]-"
}
func line(list: [String], by: Int) -> String {
    let rotated = rotate(list: list, by: by)
    var line = String()

    for note in rotated {
        line += fret(note: note)
    }
    return line
}
func isolate(list: [String], choices: [String]) -> [String] {
    return list.map({
        (e: String) -> String in
        return choices.contains(e) ? e : "_"
    })
}
func fretboard(discourse: [String], choices: [String]) {
    print(" 0           3       5       7       9");
    print(line(list: isolate(list: discourse, choices: choices), by:  7))
    print(line(list: isolate(list: discourse, choices: choices), by:  2))
    print(line(list: isolate(list: discourse, choices: choices), by: 10))
    print(line(list: isolate(list: discourse, choices: choices), by:  5))
    print(line(list: isolate(list: discourse, choices: choices), by:  0))
    print(line(list: isolate(list: discourse, choices: choices), by:  7))
    print(" 0           3       5       7       9");
}
func menu(prompt: String) -> String {
    print("\(prompt) ", terminator:"")
    let input = readLine(strippingNewline: true)
    return input ?? ""
}
func parse(input: String) -> [String] {
    let trim = input.trimmingCharacters(in: .whitespacesAndNewlines)
    return trim.components(separatedBy: " ")
}
func start() {
    let discourse = ["a", "A", "b", "c", "C", "d", "D", "e", "f", "F", "g", "G"]
    
    while true {
        let input     = menu(prompt: ">")
        let action    = parse(input: input)
        let command   = action[0]
        let arguments = Array(action[1..<action.endIndex])

        if command == "fret" {
            fretboard(discourse: discourse, choices: discourse)
        } else if command == "scale" {
            fretboard(discourse: discourse, choices: arguments)
        } else if command == "exit" {
            exit(0)
        }
    }
}

// main
func main() {
    start()
}
main()
