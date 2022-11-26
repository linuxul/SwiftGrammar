import UIKit

// Sequence
// 시퀀스(Sequence)는 직역하면 연속열이 될 수 있으며, 문자 그대로 개개의 원소들을 순서대로 하나씩 순회할 수 있는 타입을 의미한다.
// (Swift 기본 타입에 대해서는 사실상 모든 집합 타입이 이에 해당한다.) 시퀀스는 사실 Swift 문법과 밀접한 관련이 있는데, 바로 for - in 구문에 사용된다는 점이다.1

//protocol Sequence {
//    associatedtype Iterator : IteratorProtocol where Iterator.Element == Element
//    func makeIterator() -> Iterator
//}
//
//
//protocol IteratorProtcol {
//    associatedtype Element
//    mutating func next() -> Element?
//}

struct CountDown: Sequence, IteratorProtocol {
    var value: Int

    mutating func next() -> Int? {
        if value < 0 { return nil }
        value -= 1
        return value + 1
    }
}

for (index, value) in CountDown(value: 100).enumerated() {
    print("index = \(index), value = \(value)")
}
