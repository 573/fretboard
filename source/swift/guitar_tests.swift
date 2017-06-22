/* 
- issue1: rotate: negative numbers
*/


// functions
func rotate(list: [String], by: UInt) -> [String] {
    var rotated = list
    for _ in 0..<by {
        let head = rotated[0]
        let tail = rotated[1..<list.endIndex]
        rotated = tail + [head]
    }
    return rotated
}
func isolate(list: [String], choices: [String]) -> [String] {
    return list.map({
        (e: String) -> String in
        return choices.contains(e) ? e : "_"
    })
}

// tests
func rotateTest() {
    /* issue: negative numbers break code
    assert(rotate(list: [""], by:  -1)  == [""])
    assert(rotate(list: [""], by: -100) == [""])
    */

    // case1: empty
    assert(rotate(list: [""], by:   0)  == [""])
    assert(rotate(list: [""], by:   1)  == [""])
    assert(rotate(list: [""], by: 100)  == [""])

    // case2: singular
    assert(rotate(list: ["a"], by:   0)   == ["a"])
    assert(rotate(list: ["a"], by:   1)   == ["a"])
    assert(rotate(list: ["a"], by:   100) == ["a"])

    // case3: multiple
    assert(rotate(list: ["a", "b"], by:   0) == ["a", "b"])
    assert(rotate(list: ["a", "b"], by:   1) == ["b", "a"])
    assert(rotate(list: ["a", "b"], by:   2) == ["a", "b"])
}
func isolateTest() {
    // case1: empty
    assert(isolate(list: [""], choices: [""])       == [""])  
    assert(isolate(list: [""], choices: [" "])      == ["_"])  
    assert(isolate(list: [""], choices: ["a", "b"]) == ["_"])

    // case2: singular
    assert(isolate(list: ["a"], choices: [""])       == ["_"])
    assert(isolate(list: ["a"], choices: ["a"])      == ["a"])
    assert(isolate(list: ["a"], choices: ["a", "b"]) == ["a"])

    // case3: multiple
    assert(isolate(list: ["a", "b"], choices: [""])       == ["_", "_"])
    assert(isolate(list: ["a", "b"], choices: ["a"])      == ["a", "_"])
    assert(isolate(list: ["a", "b"], choices: ["b"])      == ["_", "b"])
    assert(isolate(list: ["a", "b"], choices: ["a", "b"]) == ["a", "b"])
}

// main
func main() {
    rotateTest()
    isolateTest()
}
main()
