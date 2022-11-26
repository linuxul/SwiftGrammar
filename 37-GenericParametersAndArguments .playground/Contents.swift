import UIKit

// 37.제너릭 파라미터와 인수 (Generic Parameters and Arguments)


// 제너릭 파라미터 절 (Generic Parameter Clause)
func simpleMax<T: Comparable>(_ x: T, _ y: T) -> T {
    if x < y {
        return y
    }
    return x
}


var simple_1 = simpleMax(17, 42) // T is inferred to be Int
var simple_2 = simpleMax(3.14159, 2.71828) // T is inferred to be Double

print("simple_1 = \(simple_1)")
print("simple_2 = \(simple_2)")

struct DateStruct {
    let year: Int
    let month: Int
    let day: Int
}

extension DateStruct: Comparable {
    static func < (lhs: DateStruct, rhs: DateStruct) -> Bool {
        if lhs.year != rhs.year {
            return lhs.year < rhs.year
        } else if lhs.month != rhs.month {
            return lhs.month < rhs.month
        } else {
            return lhs.day < rhs.day
        }
    }
}

let spaceOddity = DateStruct(year: 1969, month: 7, day: 11)   // July 11, 1969
let moonLanding = DateStruct(year: 1969, month: 7, day: 20)   // July 20, 1969

// DateStruct는 Comparable protocol을 채택을 해서 simpleMax를 사용을 함.
var simple_3 = simpleMax(spaceOddity, moonLanding)
print("simple_3 = \(simple_3)")

// simpleMax 함수를 다음과 같이 사용을 할 수 있다.
//func simpleMaxWhere<T> where T: Comparable (_ x: T, _ y: T) {
//
//}

protocol SomeProtocol: Comparable {
    var type: String { get set }
}

struct Student: SomeProtocol {
    var type: String = "type"
    var name: String = ""

    static func < (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name
    }
}

func printGeneric<C1: SomeProtocol, C2: SomeProtocol>(inputX: C1, inputY: C2) {
    print("inputX = \(inputX), inputY = \(inputY)")
}

var student_1 = Student(name: "학생1")
var student_2 = Student(name: "학생2")

printGeneric(inputX: student_1, inputY: student_2)


//extension Student where Element: SomeProtocol {
//
//    func resetData() {
//
//    }
//
////    func startsWithZero() -> Bool where Element: Student {
////        return false
////    }
//}
//
//print(student_1.resetData())


//
//
//// 제너릭 인수 절 (Generic Argument Clause)
//struct Dictionary<Key: Hashable, Value>: Collection, ExpressibleByDictionaryLiteral {
//    /* ... */
//}
//
//
//let arrayOfArrays: Array<Array<Int>> = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

class Node<T> {
    var value: T?
    var prev: Node<T>?
    var next: Node<T>?

    init(value: T) {
        self.value = value
    }
}

protocol Queueable {
    associatedtype ElementType

    var name: String { get set }
    var front: Node<ElementType>? { get set }

    func isEmpty() -> Bool
}

//func matchesType<Q1: Queueable, Q2: Queueable where Q1.ValueType == Q2.ValueType, Q1.ValueType: Equatable>(lhs: Q1, rhs:Q2) -> Bool {
//    return false
//}

func matchesType<Q1: Queueable, Q2: Queueable>(lhs: Q1, rhs:Q2) -> Bool {
    return false
}

