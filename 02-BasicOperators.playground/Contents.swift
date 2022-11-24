import UIKit

// 02.기본 연산자 (Basic Operators)


// 대입 연산자 (Assignment Operator)
let bVaule = 10
var aValue = 5
var cValue = aValue = bVaule
// a is now equal to 10


let (x, y) = (1, 2)
// x is equal to 1, and y is equal to 2


//if x = y {
//    // This is not valid, because x = y does not return a value.
//}


// 산술 연산자 (Arithmetic Operators)
1 + 2       // equals 3
5 - 3       // equals 2
2 * 3       // equals 6
10.0 / 2.5  // equals 4.0


"hello, " + "world"  // equals "hello, world"


// 나머지 연산자 (Remainder Operator)
9 % 4    // equals 1


9 % 4 // equals -1


// 단항 빼기 연산자 (Unary Minus Operator)
let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"


// 단항 더하기 연산자 (Unary Plus Operator)
let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6


// 복합 대입 연산자 (Compound Assignment Operators)
var a = 1
a += 2
// a is now equal to 3


// 비교 연산자 (Comparison Operators)
1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 is not equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 is not less than or equal to 1


let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// Prints "hello, world", because name is indeed equal to "world".


(1, "zebra") < (2, "apple")   // true because 1 is less than 2; "zebra" and "apple" are not compared
(3, "apple") < (3, "bird")    // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog")      // true because 4 is equal to 4, and "dog" is equal to "dog"


("blue", -1) < ("purple", 1)        // OK, evaluates to true
//("blue", false) < ("purple", true)  // Error because < can't compare Boolean values


// 삼항 조건 연산자 (Ternary Conditional Operator)
//if question {
//    answer1
//} else {
//    answer2
//}
let questionValue = 10
let resultValue = (questionValue == 10) ? 1 : 0


let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90


let contentHeightValue = 40
let hasHeaderValue = true
let rowHeightValue: Int
if hasHeaderValue {
    rowHeightValue = contentHeightValue + 50
} else {
    rowHeightValue = contentHeightValue + 20
}
// rowHeight is equal to 90


// Nil-결합 연산자 (Nil-Coalescing Operator)
var aData: Int?
aData != nil ? aData! : bVaule


let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"


userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is not nil, so colorNameToUse is set to "green"


// 닫힌 범위 연산자 (Closed Range Operator)
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25


// 반-열림 범위 연산자 (Half-Open Range Operator)
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack


// 단-방향 범위 (One-Sided Ranges)
for name in names[2...] {
    print(name)
}
// Brian
// Jack

for name in names[...2] {
    print(name)
}
// Anna
// Alex
// Brian


let rangeValue = ...5
rangeValue.contains(7)   // false
rangeValue.contains(4)   // true
rangeValue.contains(-1)  // true


let rangeData = ...5
rangeData.contains(7)   // false
rangeData.contains(4)   // true
rangeData.contains(-1)  // true


// 논리적 NOT 연산자 (Logical NOT Operator)
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"


// 논리적 AND 연산자 (Logical AND Operator)
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"


// 논리적 OR 연산자 (Logical OR Operator)
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"


// 논리적 연산자 결합 (Combining Logical Operators)
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"


// 명시적 소괄호 (Explicit Parentheses)
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"













































