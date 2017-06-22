# Report
The purpose of this report is to document what I learned from writing this app in a variety of languages.

## Haskell
The first language I used was Haskell, which was interesting because I've never written a complete program in a functional language. I think the most interesting thing I've learned is that there is always a functional way to solve a problem.  

The best part of Haskell was that the resulting functional design was typed checked and robust. It was so solid that I ended up implementing the functional design in later languages.

The worst part of Haskell was the amount of research needed to start the project. Monads took the most time to learn properly because of the knowledge density of the concept. Also, control structures like a simple "switch" statement in most languages was difficult to implement because of the strong type system (In Haskell's switch statement, all cases must return the same type).

## Go
Go was a complete surprise to me because in my ignorance I've written it off as a language too simple to learn for any serious programmer. I learned the language in a day and immediately became productive and effective. The testing suite was straight forward and I loved the ability to append tests as needed. The provided go tool was refreshingly fast.

The best part of go, to me, was the consistency of language design. This helped tremendously when having problems with the language because I can usually use my intuition to guess a solution to the problem. There were no surprise edge cases and gotchas.

The worst part of go, to me, was the amount of for loops needed to solve some problems. This decreases code readability and can lead to some bugs if I don't pay attention. Also, the array literal syntax `[]int{1,2,3}`
was quite noisy. I wanted something simple like `[1,2,3]`.

## D
I have more experience in D than in the other languages, so this one was implemented faster. It used to be my favorite language because of the powerful language features and the performant compiler. There is always a way to solve a problem in D. 

The best part of D, for me, is the wide variety of language features given to me to solve a problem. This makes me more flexible as a programmer because I don't need to redefine the problem to please the language. 

The worst part of D, for me, is the verbosity of unit tests. Unlike go, a unit test isn't as simple as `go test`. I need to encapsulate some asserts in a `unittest` bracket, then run `dmd -unittest source.d` which runs the test. Also an annoyance was that when the test is finished, the program's main starts running. I felt like go did a better job with it's test suite. 

## Swift
Me and swift have been in an on and off relationship for some time. I love the language in the beginning, I then write an app, the app becomes more complicated than I thought, then I give up the language. This time I decided to finally finish my first app.

The best part about swift, for me, is the syntax along with the bundled repl that makes development almost script-like. The language is very consistent and easy on the eyes.

The worst part about swift is how many changes the language undergoes. If I'm stuck on a problem, I would research the solution only to find out that the solution is outdated. This was frustrating to me, but not a game breaker because usually the documentation was more than enough. 

