import UIKit

// Comparable
// <관계 연산자 , <=, >=, 를 사용하여 비교할 수 있는 유형입니다 >.
// protocol Comparable : Equatable


let currentTemp = Int.random(in: 1...100)
print(currentTemp)

if currentTemp >= 90 {
    print("It's a scorcher!")
} else if currentTemp < 65 {
    print("Might need a sweater today.")
} else {
    print("Seems like picnic weather!")
}
// Prints "Seems like picnic weather!"


var measurements = [1.1, 1.5, 2.9, 1.2, 1.5, 1.3, 1.2]
measurements.sort()
print(measurements)
// Prints "[1.1, 1.2, 1.2, 1.3, 1.5, 1.5, 2.9]"


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
if moonLanding > spaceOddity {
    print("Major Tom stepped through the door first.")
} else {
    print("David Bowie was following in Neil Armstrong's footsteps.")
}
// Prints "Major Tom stepped through the door first."


var dateArray = [DateStruct(year: 2001, month: 1, day: 2),
                 DateStruct(year: 2001, month: 2, day: 2),
                 DateStruct(year: 1999, month: 3, day: 2),
                 DateStruct(year: 2001, month: 4, day: 2),
                 DateStruct(year: 2001, month: 5, day: 2),
                 DateStruct(year: 2001, month: 6, day: 2),
                 DateStruct(year: 2022, month: 1, day: 1),
                 DateStruct(year: 2201, month: 1, day: 2),
                 DateStruct(year: 2021, month: 1, day: 3),
                 DateStruct(year: 2221, month: 1, day: 4)]

dateArray.sort()
print(dateArray)

let dateA = DateStruct(year: 1999, month: 3, day: 2)
let dateB = DateStruct(year: 1999, month: 3, day: 3)

print("dateA == dateB = \(dateA == dateB)")
