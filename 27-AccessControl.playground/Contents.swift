import UIKit

// 27.접근 제어 (Access Control)


// 접근 제어 구문 (Access Control Syntax)
public class SomePublicClass {}
internal class SomeInternalClass {}
fileprivate class SomeFilePrivateClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
fileprivate func someFilePrivateFunction() {}
private func somePrivateFunction() {}


class SomeInternalClass {}              // implicitly internal
let someInternalConstant = 0            // implicitly internal


// 사용자 정의 타입 (Custom Types)
public class SomePublicClass {                  // explicitly public class
    public var somePublicProperty = 0            // explicitly public class member
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

class SomeInternalClass {                       // implicitly internal class
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

fileprivate class SomeFilePrivateClass {        // explicitly file-private class
    func someFilePrivateMethod() {}              // implicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

private class SomePrivateClass {                // explicitly private class
    func somePrivateMethod() {}                  // implicitly private class member
}


// 함수 타입 (Function Types)
func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
}


private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
}


// 열거형 타입 (Enumeration Types)
public enum CompassPoint {
    case north
    case south
    case east
    case west
}


// 서브 클래싱 (Subclassing)
public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {}
}


public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}


// 상수, 변수, 프로퍼티, 그리고 서브 스크립트 (Constants, Variables, Properties, and Subscripts)
private var privateInstance = SomePrivateClass()


// Getter와 Setter (Getters and Setters)
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}


var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")
// Prints "The number of edits is 3"


public struct TrackedString {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}


// 확장에서 Private 멤버 (Private Members in Extensions)
protocol SomeProtocol {
    func doSomething()
}


struct SomeStruct {
    private var privateVariable = 12
}

extension SomeStruct: SomeProtocol {
    func doSomething() {
        print(privateVariable)
    }
}

