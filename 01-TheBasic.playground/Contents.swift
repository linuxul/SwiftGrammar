import UIKit

// 01.기본 (The Basics)


// 상수와 변수 선언 (Declaring Constants and Variables)
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0


var x = 0.0, y = 0.0, z = 0.0


// 타입 명시 (Type Annotations)
var welcomeMessage: String


welcomeMessage = "Hello"


print(welcomeMessage)


var red, green, blue: Double


// 상수와 변수의 이름 (Naming Constants and Variables)
let n = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"


var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// friendlyWelcome is now "Bonjour!"


var languageName = "Swift"
languageName = "Swift++"
// This is a compile-time error: languageName cannot be changed.


// 상수와 변수 출력 (Printing Constants and Variables)
print(friendlyWelcome)
// Prints "Bonjour!"


print("The current value of friendlyWelcome is \(friendlyWelcome)")
// Prints "The current value of friendlyWelcome is Bonjour!"


// 주석 (Comments)
// This is a comment.


/* This is also a comment
but is written over multiple lines. */


/* This is the start of the first multiline comment.
 /* This is the second, nested multiline comment. */
This is the end of the first multiline comment. */


let cat = "🐱"; print(cat)
// Prints "🐱"


// 정수 범위 (Integer Bounds)
let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8


// 타입 세이프티와 타입 유추 (Type Safety and Type Inference)
let meaningOfLife = 42
// meaningOfLife is inferred to be of type Int


let pi = 3.14159
// pi is inferred to be of type Double


let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double


// 숫자 리터럴 (Numeric Literals)
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation


let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0


let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


// 정수 변환 (Integer Conversion)
// error let cannotBeNegative: UInt8 = -1
// UInt8 cannot store negative numbers, and so this will report an error
// error let tooBig: Int8 = Int8.max + 1
// Int8 cannot store a number larger than its maximum value,
// and so this will also report an error


let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)


// 정수와 부동 소수점 변환 (Integer and Floating-Point Conversion)
let three = 3
let pointOneFourOneFiveNine = 0.14159
let piValue = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double


let integerPi = Int(pi)
// integerPi equals 3, and is inferred to be of type Int


// 타입 별칭 (Type Aliases)
typealias AudioSample = UInt16


var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0


// 부울 (Booleans)
let orangesAreOrange = true
let turnipsAreDelicious = false


if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}
// Prints "Eww, turnips are horrible."


//let iError = 1
//if iError {
//    // this example will not compile, and will report an error
//}


let iValue = 1
if iValue == 1 {
    // this example will compile successfully
}


// 튜플 (Tuples)
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")


let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"


let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"


let http200Status = (statusCode: 200, description: "OK")


print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK"


// 옵셔널 (Optionals)
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int"


var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
serverResponseCode = nil
// serverResponseCode now contains no value


var surveyAnswer: String?
// surveyAnswer is automatically set to nil


// if 구문과 강제로 풀기 (If Statements and Forced Unwrapping)
if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// Prints "convertedNumber contains some integer value."


if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// Prints "convertedNumber has an integer value of 123."


// 옵셔널 바인딩 (Optional Binding)
if let actualNumber = Int(possibleNumber) {
    print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("The string \"\(possibleNumber)\" could not be converted to an integer")
}
// Prints "The string "123" has an integer value of 123"


let myNumber = Int(possibleNumber)
// Here, myNumber is an optional integer
if let myNumber = myNumber {
    // Here, myNumber is a non-optional integer
    print("My number is \(myNumber)")
}
// Prints "My number is 123"


//if let myNumber {
//    print("My number is \(myNumber)")
//}
//// Prints "My number is 123"


if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"


// 암시적으로 언래핑된 옵셔널 (Implicitly Unwrapped Optionals)
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation point

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation point


let optionalString = assumedString
// The type of optionalString is "String?" and assumedString isn't force-unwrapped.


if assumedString != nil {
    print(assumedString!)
}
// Prints "An implicitly unwrapped optional string."


if let definiteString = assumedString {
    print(definiteString)
}
// Prints "An implicitly unwrapped optional string."


// 에러 처리 (Error Handling)
func canThrowAnError() throws {
    // this function may or may not throw an error
}


do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}


func makeASandwich() throws {
    // ...
}

//do {
//    try makeASandwich()
//    eatASandwich()
//} catch SandwichError.outOfCleanDishes {
//    washDishes()
//} catch SandwichError.missingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}


// 주장을 통한 디버깅 (Debugging with Assertions)
let age = -3
assert(age >= 0, "A person's age can't be less than zero.")
// This assertion fails because -3 is not >= 0.


assert(age >= 0)


if age > 10 {
    print("You can ride the roller-coaster or the ferris wheel.")
} else if age >= 0 {
    print("You can ride the ferris wheel.")
} else {
    assertionFailure("A person's age can't be less than zero.")
}


// 강제 전제조건 (Enforcing Preconditions)
let indexPreCondition = 10
// In the implementation of a subscript...
precondition(indexPreCondition > 0, "Index must be greater than zero.")




