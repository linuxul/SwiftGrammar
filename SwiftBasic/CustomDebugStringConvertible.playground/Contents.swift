import UIKit

// CustomDebugStringConvertible
// 디버깅 목적에 적합한 사용자 정의된 텍스트 표현이 있는 유형입니다.

// protocol CustomDebugStringConvertible


struct Point {
    let x: Int, y: Int
}

extension Point: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Debug x = \(x), y = \(y)"
    }


}

let p = Point(x: 21, y: 30)
print(String(reflecting: p))
//print(String(p))

// Prints "Point(x: 21, y: 30)"










