import UIKit

// CaseIterable
// 모든 값의 컬렉션을 제공하는 형식입니다.


enum CompassDirection {
    case north, south, east, west
}

extension CompassDirection: CaseIterable {

}

var compassDirection: CompassDirection = .east

print("CompassData = \(compassDirection)")
print("CompassData allCases = \(CompassDirection.allCases), \(CompassDirection.allCases.count)")

let caseList = CompassDirection.allCases
    .map({ "\($0)"})
    .joined(separator: ", ")

print("caseLast = \(caseList)")



