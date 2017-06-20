// imports
import std.stdio;

// tests
unittest {
    // case1: empty
    assert(rotate([""], 0)    == [""]);
    assert(rotate([""], 1)    == [""]);
    assert(rotate([""], 100)  == [""]);
    assert(rotate([""], -1)   == [""]);
    assert(rotate([""], -100) == [""]);

    // case2: singular
    assert(rotate(["a"], 0)    == ["a"]);
    assert(rotate(["a"], 1)    == ["a"]);
    assert(rotate(["a"], 100)  == ["a"]);
    assert(rotate(["a"], -1)   == ["a"]);
    assert(rotate(["a"], -100) == ["a"]);

    // case3: multiple
    assert(rotate(["a", "b"], 1)  == ["b", "a"]);
    assert(rotate(["a", "b"], 2)  == ["a", "b"]);
    assert(rotate(["a", "b"], 3)  == ["b", "a"]);
    assert(rotate(["a", "b"], -1) == ["a", "b"]);
}
unittest {
    // case1: empty
    assert([""].isolate([""])       == [""]);
    assert([""].isolate([" "])      == ["_"]);
    assert([""].isolate(["a", "b"]) == ["_"]);

    // case2: singular
    assert(["a"].isolate([""])       == ["_"]);
    assert(["a"].isolate(["a"])      == ["a"]);
    assert(["a"].isolate(["a", "b"]) == ["a"]);

    // case3: multiple
    assert(["a", "b"].isolate([""])       == ["_", "_"]);
    assert(["a", "b"].isolate(["a"])      == ["a", "_"]);
    assert(["a", "b"].isolate(["b"])      == ["_", "b"]);
    assert(["a", "b"].isolate(["a", "b"]) == ["a", "b"]);
}

// controls
void main() {
    start();
}
void start() {
    auto discourse = ["a", "A", "b", "c", "C", "d", "D", "e", "f", "F", "g", "G"];

    while (true) {
        auto input     = menu(">");
        auto action    = input.parse;
        auto command   = action[0];
        auto arguments = action[1..$];

        if (command == "fret") {
            fretboard(discourse, discourse);
        } else if (command == "scale") {
            fretboard(discourse, arguments);
        } else if (command == "exit" ) {
            import std.c.stdlib: exit;
            exit(0);
        }
    }
}

// functions
string[] parse(string input) {
    import std.algorithm: splitter;
    import std.array: array;
    import std.string: strip;

    return input.strip.splitter(" ").array;
}
string[] rotate(string[] list, int by) {
    for (int i = 0; i < by; i++) {
        auto head = list[0];
        auto tail = list[1..$];
        list = tail ~ head;
    }
    return list;
}
string fret(string note) {
    return "[" ~ note ~ "]-";
}
string line(string[] list, int by) {
    auto rotated = rotate(list, by);
    string line;

    foreach(note; rotated) {
        line ~= fret(note);
    }
    return line;
}
string[] isolate(string[] list, string[] choices) {
    import std.algorithm: canFind, map;
    import std.array: array;

    return list.map!(e => choices.canFind(e) ? e : "_").array;
}
void fretboard(string[] discourse, string[] choices) {
    writeln(" 0           3       5       7       9");
    isolate(discourse, choices).line(7).writeln;
    isolate(discourse, choices).line(2).writeln;
    isolate(discourse, choices).line(10).writeln;
    isolate(discourse, choices).line(5).writeln;
    isolate(discourse, choices).line(0).writeln;
    isolate(discourse, choices).line(7).writeln;
    writeln(" 0           3       5       7       9");
}
string menu(string prompt) {
    import std.string: strip;

    writef("%s ", prompt);
    return readln.strip;
}