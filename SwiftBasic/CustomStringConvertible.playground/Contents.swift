import UIKit

// CustomStringConvertible
// 사용자 정의된 텍스트 표현이 있는 유형입니다.
// protocol CustomStringConvertible

struct Point {
    let x: Int, y: Int
}

extension Point: CustomStringConvertible {
    var description: String {
        return "x = \(x), y = \(y)"
    }
}

let p = Point(x: 21, y: 30)
print(p)
// Prints "Point(x: 21, y: 30)"
