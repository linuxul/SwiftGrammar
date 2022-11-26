import UIKit

// Hashable
// protocol Hashable : Equatable
// Hasher정수 해시 값을 생성하기 위해 a로 해시될 수 있는 유형입니다 .

// struct에서 Hashable을 채택하는 것으로만 설정 가능, 구현이 필요 없음.
// enum에서 Hashable을 채택하는 것으로만 설정 가능, 구현이 필요 없음.

/// A point in an x-y coordinate system.
class GridPoint {
    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}


extension GridPoint: Hashable {
    static func == (lhs: GridPoint, rhs: GridPoint) -> Bool {
        return lhs.x == rhs.x &&
                lhs.y == rhs.y
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

var tappedPoints: Set = [GridPoint.init(x: 2, y: 3), GridPoint.init(x: 4, y: 1)]
let nextTap = GridPoint.init(x: 0, y: 1)
if tappedPoints.contains(nextTap) {
    print("Already tapped at (\(nextTap.x), \(nextTap.y)).")
} else {
    tappedPoints.insert(nextTap)
    print("New tap detected at (\(nextTap.x), \(nextTap.y)).")
}
// Prints "New tap detected at (0, 1).")

var myDict: [GridPoint: Int] = [:]

myDict[GridPoint.init(x: 1, y: 2)] = 5
myDict.updateValue(1, forKey: GridPoint.init(x: 1, y: 1))

print("myDict = \(myDict)")


enum Gender {
    case male
    case female
}

var myGender: [Gender: Int] = [:]

myGender.updateValue(10, forKey: .female)
myGender.updateValue(11, forKey: .male)

myGender[.male] = 101
myGender[.female] = 102

print("myGender = \(myGender)")

