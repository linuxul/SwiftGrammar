import UIKit

// 11. 함수

// 튜플을 사용한 상태
func statistics(_ number: Int...) -> (sum: Double, avg: Double) {
    var sum = 0

    for valueData in number {
        sum += valueData
    }

    return (sum: Double(sum), avg: Double(sum) / Double(number.count))
}

let resultTuple = statistics(1, 2, 3, 4, 5)
print("result sum = \(resultTuple.sum)")
print("result avg = \(resultTuple.avg)")


let httpStatus = (404, "Not Found")
let (statusCode, statusMessage) = httpStatus
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"


// Function Types

// (Int, Int) -> Int

func add(_ a: Int, _ b: Int) -> Int {
    print(#function)
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    print(#function)
    return a - b
}

func multiple(_ a: Int, _ b: Int) -> Int {
    print(#function)
    return a * b
}

func divide(_ a: Int, _ b: Int) -> Int {
    print(#function)
    return a / b
}

let calc: (Int, Int) -> Int = add

print("add = \(add(1, 2))")

print("calc = \(calc(3, 4))")

let firstOperand = 2
let secondOperand = 3
let op = "*"

var function: ((Int, Int) -> Int)?

switch op {
case "+":
    function = add
case "-":
    function = subtract
case "*":
    function = multiple
case "/":
    function = divide
default:
    break
}

if let calcFunction = function {
    let resultData = calcFunction(firstOperand, secondOperand)
    print("result = \(firstOperand) \(op) \(secondOperand) = \(resultData)")
} else {
    print("not supported")
}


func selectOperator(operator op: String) -> ((Int, Int) -> Int)? {
    switch op {
    case "+":
        return add
    case "-":
        return subtract
    case "*":
        return multiple
    case "/":
        return divide
    default:
        return nil
    }
}

func processResult(function f: (Int, Int) -> Int, lhs: Int, rhs: Int) -> Int {
    return f(lhs, rhs)
}

if let calc = selectOperator(operator: op) {
    let resultData = processResult(function: calc, lhs: firstOperand, rhs: secondOperand)
    print("result = \(firstOperand) \(op) \(secondOperand) = \(resultData)")
} else {
    print("not supported")
}


func newSelectOperator(operator op: String) -> ((Int, Int) -> Int)? {
    let strName = "Nested"

    func add(_ a: Int, _ b: Int) -> Int {
        print("\(strName) \(#function) \(op)")
        return a + b
    }

    func subtract(_ a: Int, _ b: Int) -> Int {
        print("\(strName) \(#function) \(op)")
        return a - b
    }

    func multiple(_ a: Int, _ b: Int) -> Int {
        print("\(strName) \(#function) \(op)")
        return a * b
    }

    func divide(_ a: Int, _ b: Int) -> Int {
        print("\(strName) \(#function) \(op)")
        return a / b
    }

    switch op {
    case "+":
        return add
    case "-":
        return subtract
    case "*":
        return multiple
    case "/":
        return divide
    default:
        return nil
    }
}

if let calc = newSelectOperator(operator: op) {
    let resultData = processResult(function: calc, lhs: firstOperand, rhs: secondOperand)
    print("result = \(firstOperand) \(op) \(secondOperand) = \(resultData)")
} else {
    print("not supported")
}

let test = 0



