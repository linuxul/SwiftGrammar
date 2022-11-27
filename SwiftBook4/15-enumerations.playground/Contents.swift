import UIKit

// 15.열거형

enum Weekday: Int {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thurday
    case friday
    case saturday
}

let calendar = Calendar.current
let weekdayComp = calendar.component(Calendar.Component.weekday, from: Date())
let week = Weekday(rawValue: weekdayComp)

switch week {
case .sunday:
    print("sunday")
case .monday:
    print("monday")
case .tuesday:
    print("tuesday")
case .wednesday:
    print("wednesday")
case .thurday:
    print("thurday")
case .friday:
    print("friday")
case .saturday:
    print("saturday")
default:
    print("none")
}

//enum VideoInterface {
//    case dvi(Int, Int)
//    case hdmi(Int, Int, Double, Bool)
//    case displayPort(CGSize)
//}
//

enum VideoInterface {
    case dvi(width: Int, height: Int)
    case hdmi(width: Int, height: Int, version: Double, audio: Bool)
    case displayPort(resolution: CGSize)
}

var inputData = VideoInterface.dvi(width: 1024, height: 1024)
print("inputData = \(inputData)")


switch inputData {
case .dvi:
    print("dvi")
case .hdmi(let width, let height, _, _):
    print("hdmi w = \(width), h = \(height)")
case let .displayPort(size):
    print("dp \(size.width)x\(size.height)")
//default:
//    print("etc")
}

if case let .dvi(width, height) = inputData {
    print("dvi w = \(width), h = \(height)")
}
