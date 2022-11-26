import UIKit

// RawRepresentable
// 연관된 원시 값으로(부터) 변환될 수 있는 유형입니다.

// protocol RawRepresentable<RawValue>

enum Counter: Int {
    case one = 1, two, three, four, five
}

extension Counter: RawRepresentable {
    typealias RawValue = Int

    var rawValue: Int {
        switch self {
        case .one:
            return 100
        case .two:
            return 200
        case .three:
            return 300
        case .four:
            return 400
        case .five:
            return 500
        }
    }

    init?(rawValue: Int) {
        if rawValue % 2 == 0 {
            self = .one
        } else {
            self = .five
        }
    }
}


for i in 3...6 {
    print(Counter(rawValue: i) ?? "failed")
}
// Prints "Optional(Counter.three)"
// Prints "Optional(Counter.four)"
// Prints "Optional(Counter.five)"
// Prints "nil"

let counter_1 = Counter.init(rawValue: 100)
print("counter_1 = \(String(describing: counter_1))")

var counter_2 = Counter.five
print("counter_2 = \(counter_2)")

counter_2 = .one
print("counter_2 = \(counter_2)")


struct Directions: OptionSet {
    let rawValue: UInt8

    static let up    = Directions(rawValue: 1 << 0)
    static let down  = Directions(rawValue: 1 << 1)
    static let left  = Directions(rawValue: 1 << 2)
    static let right = Directions(rawValue: 1 << 3)
}

let allowedMoves: Directions = [.up, .down, .left]
print(allowedMoves.rawValue)


print(allowedMoves.contains(.right))
// Prints "false"
print(allowedMoves.rawValue & Directions.right.rawValue)
// Prints "0"


