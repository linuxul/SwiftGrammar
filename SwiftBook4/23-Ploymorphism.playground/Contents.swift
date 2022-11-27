import UIKit

// 23.다형성

func process(_ value: Int) {
    print("process Int")
}

func process(_ value: Double) {
    print("process Double")
}

process(1)

//process(1.0)

func process(_ value: String = "default") {
    print("process(_:)")
}

func process(string value: String) {
    print("process(string:)")
}

func process(str value: String) {
    print("process(str:)")
}

process("swift")

process(string: "swift")

process(str: "swift")


func process(_ value: Double) -> Int {
    print("process double return integer.")
    return Int(value)
}

func process(_ value: Double) -> Double {
    print("process double return double.")
    return value
}

var return_1: Int = process(1.1)

var return_2: Double = process(1.2)


func process() {
    print("process something")
}

process()


class MyClass {

    init() {
        print("process init")
    }

    init(value: Int = 0) {
        print("process init integer")
    }

    init?(value: Double) {
        print("process init failed double")
    }

    convenience init(value: String) {
        print("process convenience init")

        self.init()
    }

    subscript(index: Int) -> Int {
        print("process subscript init integer")
        return 0
    }

    subscript(index: Int) -> Double {
        print("process subscript init double")
        return 0.0
    }

    subscript(key: String) -> Double {
        print("process subscript init key double")
        return 0.0
    }

    func process(_ value: Int) {
        print("process integer - instance")
    }

    static func process(_ value: Int) {
        print("process integer - type")
    }

    func process(_ value: Double) {
        print("process Double")
    }
}

let returnClass = MyClass()

returnClass.process(1)
returnClass.process(1.0)

MyClass.process(1)


let returnInt: Int = returnClass[0]
print(returnInt)

let returnDouble: Double = returnClass[0]
print(returnDouble)

let returnData = returnClass["key"]
print(returnData)


class Super {
    var value = 0

    func hello() {
        print("Hello, I'm super class")
    }
}

class Sub: Super {

    // 1. get, set으로 속성을 구현
    override var value: Int {
        get {
            print("getter of value")
            return super.value
        }
        set {
            print("setter of value")
            super.value = newValue
        }
    }

//    // 2. didSet, willSet으로 속성을 구현
//    override var value: Int {
//        didSet {
//            print("didSet")
//        }
//    }


    override func hello() {
        super.hello()
        print("Hello, I'm sub class")
    }
}

let a = Super()
a.hello()
a.value = 120
print(a.value)

let b = Sub()
b.hello()
b.value = 456
print(b.value)


class Shape: NSObject {
    func draw() {
        print("draw shape")
    }
}

class Rectangle: Shape {
    override func draw() {
        print("draw rectangle")
    }
}

class Square: Rectangle {
    override func draw() {
        print("draw square")
    }
}

class Circle: Shape {
    var radius = 0.0

    override func draw() {
        print("draw circle")
    }

    func roll() {
        print("rolling circle")
    }
}

let r = Rectangle()

if r.isMember(of: Rectangle.self) {
    print("r is a member of Rectangle class")
} else {
    print("r is not a member of Rectangle class")
}

if r.isMember(of: Shape.self) {
    print("r is a member of Shape class")
} else {
    print("r is not a member of Shape class")
}

// isKind(of:) - 클래스 인스턴스, 상속에 속한 클래스 인스턴스
if r.isKind(of: Rectangle.self) {
    print("r is a kind of Rectangle class")
} else {
    print("r is not a kind of Rectangle class")
}

if r.isKind(of: Shape.self) {
    print("r is a kind of Shape class")
} else {
    print("r is not a kind of Shape class")
}


if Circle.isSubclass(of: Shape.self) {
    print("Circle is a subclass of Shape")
} else {
    print("Circle is not a subclass of Shape")
}

if Shape.conforms(to: NSObjectProtocol.self) {
    print("Shape conforms to the NSObjectProtocol")
} else {
    print("Shape don't conforms to the NSObjectProtocol")
}


let rType: AnyObject = Rectangle()

if rType is Rectangle {
    print("rType is a kind of Rectangle class")
} else {
    print("rType isn't a kind of Rectangle class")
}


if rType is Shape {
    print("rType is a kind of Shape class")
} else {
    print("rType isn't a kind of Shape class")
}
//

if rType is NSObjectProtocol {
    print("rType conforms to the NSObjectProtocol")
} else {
    print("rType don't conforms to the NSObjectProtocol")
}

// 업캐스틍
var s: Shape = Circle()
print(s)
s.draw()

let shape = Shape()
let rect = Rectangle()
let square = Square()
let circle = Circle()

let listData = [shape, rect, square, circle]

for element in listData {
    if let circle = element as? Circle {
        circle.roll()
    } else if let rect = element as? Rectangle {
        rect.draw()
    }
}

var test = 0
