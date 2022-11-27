import UIKit

// 12.클로저

let simpleClosure = { print("Hello, World!")}
simpleClosure()

let simpleClosure_1 = { (str: String) -> String in
    return "Hello, \(str)"
}
var result = simpleClosure_1("Swift Closure")
print(result)

func performClosure(_ c: (String) -> (String)) {
    let result = c("Swift Closure!!")
    print(result)
}

performClosure(simpleClosure_1)


performClosure({ str in
    return "Hello, \(str)!!!"
})

performClosure({ "Hello.!!! \($0)" })

let numbers = [1, 51, 22, 33, 44, 55]
let orderedName = numbers.sorted { (lhs: Int, rhs: Int) in
    return lhs < rhs
}

print("orderedName = \(orderedName)")


let orderedName_1 = numbers.sorted(by: < )
print("orderedName_1 = \(orderedName_1)")

performClosure({ "Hello, \($0)" })

performClosure() { "Hello, Test = \($0)" }
























let test = 0

