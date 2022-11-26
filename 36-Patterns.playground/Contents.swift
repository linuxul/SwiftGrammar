import UIKit

// 36.패턴 (Patterns)


// 와일드 카드 패턴 (Wildcard Pattern)
for _ in 1...3 {
    // Do something three times.
}


// 식별자 패턴 (Identifier Pattern)
let someValue = 42


// 값-바인딩 패턴 (Value-Binding Pattern)
var point = (3, 2)
//point = (1, 2, 4)
switch point {
    // Bind x and y to the elements of point.
case let (x, y):
    print("The point is at (\(x), \(y)).")

//case let (x, y, z):
//    print("The point \(x), \(y), \(z)")
}
// Prints "The point is at (3, 2)."


// 튜플 패턴 (Tuple Pattern)
var points = [(0, 0), (1, 0), (1, 1), (2, 0), (2, 1)]
// This code isn't valid.
for (key, value) in points {
    /* ... */
    print("key = \(key), value = \(value)")
}


//let a = 2        // a: Int = 2
//let (a) = 2      // a: Int = 2
//let (a): Int = 2 // a: Int = 2


// 열거형 케이스 패턴 (Enumeration Case Pattern)
enum SomeEnum {
    case left, right
}

let x: SomeEnum? = .left
switch x {
case .left:
    print("Turn left")
case .right:
    print("Turn right")
case nil:
    print("Keep going straight")
}
// Prints "Turn left"
print(x)


// 옵셔널 패턴 (Optional Pattern)
let someOptional: Int? = 42
// Match using an enumeration case pattern.
if case .some(let x) = someOptional {
    print(x)
}

// Match using an optional pattern.
if case let x? = someOptional {
    print(x)
}

if case .some(let y) = someOptional {
    print("y = \(y)")
}

if case let z? = someOptional {
    print("z = \(z)")
}

let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]
// Match only non-nil values.
for case let number? in arrayOfOptionalInts {
    print("Found a \(number)")
}
// Found a 2
// Found a 3
// Found a 5

for case let displayInt? in arrayOfOptionalInts {
    print("display = \(displayInt)")
}

var mapArray = arrayOfOptionalInts.compactMap { $0 }
print("mapArray = \(mapArray)")

// 타입-캐스팅 패턴 (Type-Casting Patterns)
struct Student {
    var name = ""
}

var student_1 = Student()

var isType = student_1 is Student

if student_1 is Student {
    print("Student")
}



// 표현식 패턴 (Expression Pattern)
point = (1, 2)
switch point {
case (0, 0):
    print("(0, 0) is at the origin.")
case (-2...2, -2...2):
    print("(\(point.0), \(point.1)) is near the origin.")
default:
    print("The point is at (\(point.0), \(point.1)).")
}
// Prints "(1, 2) is near the origin."


// Overload the ~= operator to match a string with an integer.
func ~= (pattern: String, value: Int) -> Bool {
    return pattern == "\(value)"
}
switch point {
case ("0", "0"):
    print("(0, 0) is at the origin.")
default:
    print("The point is at (\(point.0), \(point.1)).")
}
// Prints "The point is at (1, 2)."



