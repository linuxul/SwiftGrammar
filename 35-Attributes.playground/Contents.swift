import UIKit

// 35.속성 (Attributes)


// available
// First release
protocol MyProtocol {
    // protocol definition
}


// Subsequent release renames MyProtocol
protocol MyRenamedProtocol {
    // protocol definition
}


@available(*, unavailable, renamed: "MyRenamedProtocol")
typealias MyProtocolNew = MyRenamedProtocol


@available(iOS 10.0, macOS 10.12, *)
class MyClass {
    // class definition
    var name = ""
}

var myclass_1 = MyClass.init()
print("myclass = \(myclass_1)")


@available(swift 5.0.0)
//@available(swift 6.0.0)
//@available(macOS 10.12, *)
struct MyStruct {
    // struct definition
    var name = ""
}

var myStruct_1 = MyStruct()
print("myStruct = \(myStruct_1)")


// dynamicCallable
@dynamicCallable
struct TelephoneExchange {
    func dynamicallyCall(withArguments phoneNumber: [Int]) {
        if phoneNumber == [4, 1, 1] {
            print("Get Swift help on forums.swift.org")
        } else {
            print("Unrecognized number")
        }
    }
}

let dial = TelephoneExchange()

// Use a dynamic method call.
dial(4, 1, 2)
// Prints "Get Swift help on forums.swift.org"

dial(8, 6, 7, 5, 3, 0, 9)
// Prints "Unrecognized number"

// Call the underlying method directly.
dial.dynamicallyCall(withArguments: [4, 1, 1])


@dynamicCallable
struct Repeater {
    func dynamicallyCall(withKeywordArguments pairs: KeyValuePairs<String, Int>) -> String {
        return pairs
            .map { label, count in
                repeatElement(label, count: count).joined(separator: " ")
            }
            .joined(separator: "\n")
    }
}

let repeatLabels = Repeater()
print(repeatLabels(a: 1, b: 2, c: 3, b: 2, a: 1))
// a
// b b
// c c c
// b b
// a
print(repeatLabels(a: 1, b: 2))

//repeatLabels(a: "four") // Error

// @dynamicCallable은 둘중에 하나를 구현해야 된다.
// func dynamicallyCall(withArguments args: <#Arguments#>) -> <#R1#>
// func dynamicallyCall(withKeywordArguments args: <#KeywordArguments#>) -> <#R2#>

@dynamicCallable
struct Contact {
    var persons: [String: String]

    func dynamicallyCall(withArguments args: [String]) {
        print("person = \(persons), args = \(args)")
    }
}

let contact_1 = Contact(persons: [
    "지구": "사람",
    "달": "토끼"
])

contact_1()
contact_1("지구")
contact_1("달")

struct ContactLook {
    var persons: [String: String]

    subscript(planet: String) -> String? {
        get {
            return self.persons[planet]
        }
        set {
            self.persons[planet] = newValue
        }
    }
}

var contact_2 = ContactLook(persons: [
    "지구": "사람",
    "달": "토끼"
])

print("contact_3 = \(contact_2["지구"])")
contact_2["지구"] = "walker"
print("contact_3 = \(contact_2["지구"])")


@dynamicMemberLookup
struct ContactLookup {
    var persons: [String: String]

    subscript(dynamicMember plant: String) -> String? {
        return self.persons[plant]
    }
}

var contact_4 = ContactLookup(persons: [
    "지구": "사람",
    "달": "토끼"
])

print("contact_4 = \(contact_4[dynamicMember: "지구"])")
//contact_4[dynamicMember: "지구"] = "walker"
print("contact_4 = \(contact_4.지구)")
print("contact_4 = \(contact_4.화성)")



// dynamicMemberLookup
@dynamicMemberLookup
struct DynamicStruct {
    let dictionary = ["someDynamicMember": 325,
                      "someOtherMember": 787]
    subscript(dynamicMember member: String) -> Int {
        return dictionary[member] ?? 1054
    }
}
let s = DynamicStruct()

// Use dynamic member lookup.
let dynamic = s.someDynamicMember
print(dynamic)
// Prints "325"

// Call the underlying subscript directly.
let equivalent = s[dynamicMember: "someDynamicMember"]
print(dynamic == equivalent)
// Prints "true"


struct Point { var x, y: Int }

@dynamicMemberLookup
struct PassthroughWrapper<Value> {
    var value: Value
    subscript<T>(dynamicMember member: KeyPath<Value, T>) -> T {
        get { return value[keyPath: member] }
    }
}

let point = Point(x: 381, y: 431)
let wrapper = PassthroughWrapper(value: point)
print(wrapper.x)


// main
//@main
//struct MyTopLevel {
//    static func main() {
//        // Top-level code goes here
//    }
//}


protocol ProvidesMain {
    static func main() throws
}


// NSApplicationMain
//import AppKit
//NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)


// objc
class ExampleClass: NSObject {
    @objc var enabled: Bool {
        @objc(isEnabled) get {
            // Return the appropriate value
            return true
        }
    }
}


// propertyWrapper
@propertyWrapper
struct SomeWrapper {
    var wrappedValue: Int
    var someValue: Double
    init() {
        self.wrappedValue = 100
        self.someValue = 12.3
    }
    init(wrappedValue: Int) {
        self.wrappedValue = wrappedValue
        self.someValue = 45.6
    }
    init(wrappedValue value: Int, custom: Double) {
        self.wrappedValue = value
        self.someValue = custom
    }
}

struct SomeStruct {
    // Uses init()
    @SomeWrapper var a: Int

    // Uses init(wrappedValue:)
    @SomeWrapper var b = 10

    // Both use init(wrappedValue:custom:)
    @SomeWrapper(custom: 98.7) var c = 30
    @SomeWrapper(wrappedValue: 30, custom: 98.7) var d
}

var someStruct = SomeStruct()
print("someStruct = \(someStruct)")

someStruct.b = 2000
print("someStruct = \(someStruct)")


@propertyWrapper
struct Uppercase {

    private var value: String = ""

    var wrappedValue: String {
        get { self.value }
        set { self.value = newValue.uppercased() }
    }

    init(wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
}

struct Address {
    @Uppercase var town: String

    @Uppercase(wrappedValue: "earch")
    var planet: String
}

let address = Address(town: "Seoul")
print(address.town)
print(address.planet)


@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    var container: UserDefaults = .standard

    var wrappedValue: T {
        get {
            return container.object(forKey: key) as? T ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key)
        }
    }
}

extension UserDefaults {
    @UserDefault(key: "iUserId", defaultValue: "")
    static var iUserId: String
    @UserDefault(key: "tSessionId", defaultValue: "")
    static var tSessionId: String
}

UserDefaults.iUserId = "1234234"

print("userid = \(UserDefaults.iUserId)")





@propertyWrapper
struct WrapperWithProjection {
    var wrappedValue: Int
    var projectedValue: SomeProjection {
        return SomeProjection(wrapper: self)
    }
}
struct SomeProjection {
    var wrapper: WrapperWithProjection
}

//struct SomeStruct {
//    @WrapperWithProjection var x = 123
//}
//let s = SomeStruct()
//s.x           // Int value
//s.$x          // SomeProjection value
//s.$x.wrapper  // WrapperWithProjection value


// 결과-빌딩 메서드 (Result-Building Methods)
@resultBuilder
struct ArrayBuilder {
    typealias Component = [Int]
    typealias Expression = Int
    static func buildExpression(_ element: Expression) -> Component {
        return [element]
    }
    static func buildOptional(_ component: Component?) -> Component {
        guard let component = component else { return [] }
        return component
    }
    static func buildEither(first component: Component) -> Component {
        return component
    }
    static func buildEither(second component: Component) -> Component {
        return component
    }
    static func buildArray(_ components: [Component]) -> Component {
        return Array(components.joined())
    }
    static func buildBlock(_ components: Component...) -> Component {
        return Array(components.joined())
    }
}


// 결과 변환 (Result Transformations)
@ArrayBuilder var builderNumber: [Int] { 10 }
var manualNumber = ArrayBuilder.buildExpression(10)


protocol Drawable {
    func draw() -> String
}
struct Text: Drawable {
    var content: String
    init(_ content: String) { self.content = content }
    func draw() -> String { return content }
}
struct Line<D: Drawable>: Drawable {
    var elements: [D]
    func draw() -> String {
        return elements.map { $0.draw() }.joined(separator: "")
    }
}
struct DrawEither<First: Drawable, Second: Drawable>: Drawable {
    var content: Drawable
    func draw() -> String { return content.draw() }
}

@resultBuilder
struct DrawingBuilder {
    static func buildBlock<D: Drawable>(_ components: D...) -> Line<D> {
        return Line(elements: components)
    }
    static func buildEither<First, Second>(first: First)
        -> DrawEither<First, Second> {
            return DrawEither(content: first)
    }
    static func buildEither<First, Second>(second: Second)
        -> DrawEither<First, Second> {
            return DrawEither(content: second)
    }
}


@available(macOS 99, *)
struct FutureText: Drawable {
    var content: String
    init(_ content: String) { self.content = content }
    func draw() -> String { return content }
}
@DrawingBuilder var brokenDrawing: Drawable {
    if #available(macOS 99, *) {
        FutureText("Inside.future")  // Problem
    } else {
        Text("Inside.present")
    }
}
// The type of brokenDrawing is Line<DrawEither<Line<FutureText>, Line<Text>>>


struct AnyDrawable: Drawable {
    var content: Drawable
    func draw() -> String { return content.draw() }
}
extension DrawingBuilder {
    static func buildLimitedAvailability(_ content: Drawable) -> AnyDrawable {
        return AnyDrawable(content: content)
    }
}

@DrawingBuilder var typeErasedDrawing: Drawable {
    if #available(macOS 99, *) {
        FutureText("Inside.future")
    } else {
        Text("Inside.present")
    }
}
// The type of typeErasedDrawing is Line<DrawEither<AnyDrawable, Line<Text>>>


let someNumber = 19
@ArrayBuilder var builderConditional: [Int] {
    if someNumber < 12 {
        31
    } else if someNumber == 19 {
        32
    } else {
        33
    }
}

var manualConditional: [Int]
if someNumber < 12 {
    let partialResult = ArrayBuilder.buildExpression(31)
    let outerPartialResult = ArrayBuilder.buildEither(first: partialResult)
    manualConditional = ArrayBuilder.buildEither(first: outerPartialResult)
} else if someNumber == 19 {
    let partialResult = ArrayBuilder.buildExpression(32)
    let outerPartialResult = ArrayBuilder.buildEither(second: partialResult)
    manualConditional = ArrayBuilder.buildEither(first: outerPartialResult)
} else {
    let partialResult = ArrayBuilder.buildExpression(33)
    manualConditional = ArrayBuilder.buildEither(second: partialResult)
}


@ArrayBuilder var builderOptional: [Int] {
    if (someNumber % 2) == 1 { 20 }
}

var partialResult: [Int]? = nil
if (someNumber % 2) == 1 {
    partialResult = ArrayBuilder.buildExpression(20)
}
var manualOptional = ArrayBuilder.buildOptional(partialResult)


@ArrayBuilder var builderBlock: [Int] {
    100
    200
    300
}

var manualBlock = ArrayBuilder.buildBlock(
    ArrayBuilder.buildExpression(100),
    ArrayBuilder.buildExpression(200),
    ArrayBuilder.buildExpression(300)
)


@ArrayBuilder var builderArray: [Int] {
    for i in 5...7 {
        100 + i
    }
}

var temporary: [[Int]] = []
for i in 5...7 {
    let partialResult = ArrayBuilder.buildExpression(100 + i)
    temporary.append(partialResult)
}
let manualArray = ArrayBuilder.buildArray(temporary)


