import UIKit

// 34.선언 (Declarations)


// 상수 선언 (Constant Declaration)
let (firstNumber, secondNumber) = (10, 42)


print("The first number is \(firstNumber).")
// Prints "The first number is 10."
print("The second number is \(secondNumber).")
// Prints "The second number is 42."


// 변수 선언 (Variable Declaration)
class Superclass {
    private var xValue = 12
    var x: Int {
        get { print("Getter was called"); return xValue }
        set { print("Setter was called"); xValue = newValue }
    }
}

// This subclass doesn't refer to oldValue in its observer, so the
// superclass's getter is called only once to print the value.
class New: Superclass {
    override var x: Int {
        didSet { print("New value \(oldValue)., \(x)") }
        willSet { print("New will value , \(x)")}
    }
}
let new = New()
new.x = 100
// Prints "Setter was called"
// Prints "Getter was called"
// Prints "New value 100"


// This subclass refers to oldValue in its observer, so the superclass's
// getter is called once before the setter, and again to print the value.
class NewAndOld: Superclass {
    override var x: Int {
        didSet { print("Old value \(oldValue) - new value \(x)") }
    }
}
let newAndOld = NewAndOld()
newAndOld.x = 200



// Prints "Getter was called"
// Prints "Setter was called"
// Prints "Getter was called"
// Prints "Old value 12 - new value 200"




// 타입 별칭 선언 (Type Alias Declaration)
typealias StringDictionary<Value> = Dictionary<String, Value>

// The following dictionaries have the same type.
var dictionary1: StringDictionary<Int> = [:]
var dictionary2: Dictionary<String, Int> = [:]


typealias DictionaryOfInts<Key: Hashable> = Dictionary<Key, Int>


typealias Diccionario = Dictionary


//protocol Sequence {
//    associatedtype Iterator: IteratorProtocol
//    typealias Element = Iterator.Element
//}

func sum<T: Sequence>(_ sequence: T) -> Int where T.Element == Int {
    return sequence.reduce(0, +)
}

struct CountDown: Sequence, IteratorProtocol {
    var value: Int

    mutating func next() -> Int? {
        if value < 0 { return nil }
        value -= 1
        return value + 1
    }
}

//for (index, value) in CountDown(value: 100).enumerated() {
//    print("index = \(index), value = \(value)")
//}

let count_1 = CountDown(value: 100)

let sum_1 = sum(count_1)
print("sum = \(sum_1)")


func f(x: Int, y: Int) -> Int { return x + y }
f(x: 1, y: 2) // both x and y are labeled


func repeatGreeting(_ greeting: String, count n: Int) { /* Greet n times */ }
repeatGreeting("Hello, world!", count: 2) //  count is labeled, greeting is not


// In-Out 파라미터 (In-Out Parameters)
func someFunction(_ a: inout Int) -> () -> Int {
    return { [a] in return a + 1 }
}

func multithreadedFunction(queue: DispatchQueue, x: inout Int) {
    // Make a local copy and manually copy it back.
    var localX = x
    defer { x = localX }

    // Operate on localX asynchronously, then wait before returning.
//    queue.async { someFunction(&localX) }
    queue.sync {}
}


// 특별한 종류의 파라미터 (Special Kinds of Parameters)
func f(x: Int = 42) -> Int { return x }
f()       // Valid, uses default value
f(x: 7)   // Valid, uses the value provided
//f(7)      // Invalid, missing argument label


// 특별한 이름의 메서드 (Methods with Special Names)
struct CallableStruct {
    var value: Int
    func callAsFunction(_ number: Int, scale: Int) {
        print(scale * (number + value))
    }
}
let callable = CallableStruct(value: 100)
callable(4, scale: 2)
callable.callAsFunction(4, scale: 2)
// Both function calls print 208.


// let someFunction1: (Int, Int) -> Void = callable(_:scale:)  // Error
let someFunction2: (Int, Int) -> Void = callable.callAsFunction(_:scale:)


// 다시 던지는 함수와 메서드 (Rethrowing Functions and Methods)
func someFunction(callback: () throws -> Void) rethrows {
    try callback()
}


//func alwaysThrows() throws {
//    throw SomeError.error
//}
//func someFunction(callback: () throws -> Void) rethrows {
//    do {
//        try callback()
//        try alwaysThrows()  // Invalid, alwaysThrows() isn't a throwing parameter
//    } catch {
//        throw AnotherError.error
//    }
//}


// 모든 타입의 케이스가 있는 열거형 (Enumerations with Cases of Any Type)
enum Number {
    case integer(Int)
    case real(Double)
}
let f = Number.integer
// f is a function of type (Int) -> Number

// Apply f to create an array of Number instances with integer values
let evenInts: [Number] = [0, 2, 4, 6].map(f)
print("evenInts = \(evenInts)")

// 간접 열거형 (Enumerations with Indirection)
enum Tree<T> {
    case empty
    indirect case node(value: T, left: Tree, right: Tree)
}


// 원시값 타입의 케이스를 가진 열거형 (Enumerations with Cases of a Raw-Value Type)
enum ExampleEnum: Int {
    case a, b, c = 5, d
}


enum GamePlayMode: String {
    case cooperative, individual, competitive
}


// 프로토콜 선언 (Protocol Declaration)
protocol SomeProtocol {
    static var someValue: Self { get }
    static func someFunction(x: Int) -> Self
}
//enum MyEnum: SomeProtocol {
//    case someValue
//    case someFunction(x: Int)
//}


protocol SomeProtocolAny: AnyObject {
    /* Protocol members go here */
}


// 프로토콜 연관된 타입 선언 (Protocol Associated Type Declaration)
//protocol SomeProtocol {
//    associatedtype SomeType
//}
//
//protocol SubProtocolA: SomeProtocol {
//    // This syntax produces a warning.
//    associatedtype SomeType: Equatable
//}
//
//// This syntax is preferred.
//protocol SubProtocolB: SomeProtocol where SomeType: Equatable { }


// 실패 가능한 초기화 구문 (Failable Initializers)
struct SomeStruct {
    let property: String
    // produces an optional instance of 'SomeStruct'
    init?(input: String) {
        if input.isEmpty {
            // discard 'self' and return 'nil'
            return nil
        }
        property = input
    }
}


if let actualInstance = SomeStruct(input: "Hello") {
    // do something with the instance of 'SomeStruct'
} else {
    // initialization of 'SomeStruct' failed and the initializer returned 'nil'
}


// 재정의한 요구사항은 일부 제너릭 컨텍스트에서 사용되지 않음 (Overridden Requirements Aren’t Used in Some Generic Contexts)
//protocol Loggable {
//    func log()
//}
//extension Loggable {
//    func log() {
//        print(self)
//    }
//}
//
//protocol TitledLoggable: Loggable {
//    static var logTitle: String { get }
//}
//extension TitledLoggable {
//    func log() {
//        print("\(Self.logTitle): \(self)")
//    }
//}
//
//struct Pair<T>: CustomStringConvertible {
//    let first: T
//    let second: T
//    var description: String {
//        return "(\(first), \(second))"
//    }
//}
//
//extension Pair: Loggable where T: Loggable { }
//extension Pair: TitledLoggable where T: TitledLoggable {
//    static var logTitle: String {
//        return "Pair of '\(T.logTitle)'"
//    }
//}
//
//extension String: TitledLoggable {
//    static var logTitle: String {
//        return "String"
//    }
//}
//
//
//let oneAndTwo = Pair(first: "one", second: "two")
//oneAndTwo.log()
//// Prints "Pair of 'String': (one, two)"
//
//
//func doSomething<T: Loggable>(with x: T) {
//    x.log()
//}
//doSomething(with: oneAndTwo)
//// Prints "(one, two)"
//

protocol Loggable {
    func log()
}

extension Loggable {
    func log() {
        print("Loggable = \(self)")
    }
}

protocol TitledLoggable: Loggable {
    static var logTitle: String { get }
}

extension TitledLoggable {
    func log() {
        print("TitleLoggable title = \(Self.logTitle), \(self)")
    }
}

struct Pair<T>: CustomStringConvertible {
    var first: T
    var second: T

    var description: String {
        return "first = \(first), second = \(second)"
    }
}

extension Pair: Loggable where T: Loggable {
//    func log() {
//        "Pair \(self)"
//    }
}

extension Pair: TitledLoggable where T: TitledLoggable {
    static var logTitle: String {
        return "Pair of \(T.logTitle)"
    }
}

extension String: TitledLoggable {
    static var logTitle: String {
        return "String"
    }
}

extension Int: TitledLoggable {
    static var logTitle: String {
        return "Int"
    }
}


struct Student: Loggable {
    var name = "1"
}
var student_1 = Student()
student_1.log()

let pair_1 = Pair(first: "one", second: "two")
//print("pair_1 = \(pair_1)")
pair_1.log()

let pair_2 = Pair(first: 1, second: 2)
pair_2.log()

let pair_3 = Pair(first: Student(name: "student1"), second: Student())
pair_3.log()

func doSomething<T: Loggable>(with x: T) {
    x.log()
}

doSomething(with: Student(name: "Love"))



// 명시적 중복 해결 (Resolving Explicit Redundancy)
protocol Serializable {
    func serialize() -> Any
}

extension Array: Serializable where Element == Int {
    func serialize() -> Any {
        // implementation
        return 1
    }
}
//extension Array: Serializable where Element == String {
//    func serialize2() -> Any {
//        // implementation
//    }
//}
// Error: redundant conformance of 'Array<Element>' to protocol 'Serializable'


protocol SerializableInArray { }
extension Int: SerializableInArray { }
extension String: SerializableInArray { }

//extension Array: Serializable where Element: SerializableInArray {
//    func serialize() -> Any {
//        // implementation
//        return 0
//    }
//}


// 암시적 중복 해결 (Resolving Implicit Redundancy)
protocol MarkedLoggable: Loggable {
    func markAndLog()
}

extension MarkedLoggable {
    func markAndLog() {
        print("----------")
        log()
    }
}

extension Array: Loggable where Element: Loggable { }
extension Array: TitledLoggable where Element: TitledLoggable {
    static var logTitle: String {
        return "Array of '\(Element.logTitle)'"
    }
}
extension Array: MarkedLoggable where Element: MarkedLoggable { }


//extension Array: Loggable where Element: TitledLoggable { }
//extension Array: Loggable where Element: MarkedLoggable { }
//// Error: redundant conformance of 'Array<Element>' to protocol 'Loggable'

