package main
import (
    "testing"
    "reflect"
)

func TestRotate(t *testing.T) {
    var tests = []struct {
        list []string
        by    int
        want []string
    }{
        // case1: empty
        {[]string{""},  0,    []string{""}},
        {[]string{""},  1,    []string{""}},
        {[]string{""},  100,  []string{""}},
        {[]string{""},  -1,   []string{""}},
        {[]string{""},  -100, []string{""}},

        // case2: singular
        {[]string{"a"}, 0,    []string{"a"}},
        {[]string{"a"}, 1,    []string{"a"}},
        {[]string{"a"}, 100,  []string{"a"}},
        {[]string{"a"}, -1,   []string{"a"}},
        {[]string{"a"}, -100, []string{"a"}},

        // case3: multiple
        {[]string{"a", "b"}, 1,  []string{"b", "a"}},
        {[]string{"a", "b"}, 2,  []string{"a", "b"}},
        {[]string{"a", "b"}, 3,  []string{"b", "a"}},
        {[]string{"a", "b"}, -1, []string{"a", "b"}},
    }

    for _, test := range tests {
        if got := rotate(test.list, test.by); !reflect.DeepEqual(got, test.want) {
            t.Errorf("rotate(%s, %d) = %s", test.list, test.by, got)
        }
    }
}
func TestIsolate(t *testing.T) {
    var tests = []struct {
        list    []string
        filters []string
        want    []string
    } {
        // case1: empty
        {[]string{""}, []string{""},       []string{""}},
        {[]string{""}, []string{" "},      []string{"_"}},
        {[]string{""}, []string{"a", "b"}, []string{"_"}},
        
        // case2: singular
        {[]string{"a"}, []string{""},       []string{"_"}},
        {[]string{"a"}, []string{"a"},      []string{"a"}},
        {[]string{"a"}, []string{"a", "a"}, []string{"a"}},

        // case3: multiple
        {[]string{"a", "b"}, []string{""},       []string{"_", "_"}},
        {[]string{"a", "b"}, []string{"a"},      []string{"a", "_"}},
        {[]string{"a", "b"}, []string{"b"},      []string{"_", "b"}},
        {[]string{"a", "b"}, []string{"a", "b"}, []string{"a", "b"}},
    }

    for _, test := range tests {
        if got := isolate(test.list, test.filters); !reflect.DeepEqual(got, test.want) {
            t.Errorf("isolate(%s, %s) = %s", test.list, test.filters, got)
        }
    }
}