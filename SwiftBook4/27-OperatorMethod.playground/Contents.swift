import UIKit

// 27.연산자 메소드와 사용자 정의 연산자

struct KSize {
    var width = 0.0
    var height = 0.0

    postfix static func ++(size: inout KSize) -> KSize {
        let current = size
        size = KSize(width: size.width + 1, height: size.height + 1)
        return current
    }

    prefix static func ++(size: inout KSize) -> KSize {
        size.width += 1
        size.height += 1
        return size
    }

    static func + (lhs: KSize, rhs: KSize) -> KSize {
        return KSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }

    static func * (lhs: KSize, times: Double) -> KSize {
        return KSize(width: lhs.width * times, height: lhs.height * times)
    }

//    static func += (lhs: inout KSize, rhs: KSize) {
//        lhs = KSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
//    }

//    static func + (lhs: KSize, rhs: KSize) -> KSize {
//        return KSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
//    }

    static func += (lhs: inout KSize, rhs: KSize) {
        lhs = lhs + rhs
    }

    static func == (lhs: KSize, rhs: KSize) -> Bool {
        return lhs.width == rhs.width && lhs.height == rhs.height
    }

    static func != (lhs: KSize, rhs: KSize) -> Bool {
        return lhs.width != rhs.width || lhs.height != rhs.height
    }

}

struct KOffset {
    var x = 0.0
    var y = 0.0

    prefix static func - (offset: KOffset) -> KOffset {
        return KOffset(x: -offset.x, y: -offset.y)
    }

    static func == (lhs: KOffset, rhs: KOffset) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    static func != (lhs: KOffset, rhs: KOffset) -> Bool {
        return lhs.x != rhs.x && lhs.y != rhs.y
    }

}

enum KSwitch: String {
    case on = "Swift On"
    case off = "Swift Off"
    case auto = "Swift Auto"

    mutating func push() {
        ++self
    }

    prefix static func ++(s: inout KSwitch) -> KSwitch {
        switch s {
        case KSwitch.on:
            s = KSwitch.off
        case KSwitch.off:
            s = KSwitch.auto
        case KSwitch.auto:
            s = KSwitch.on
        }
        return s
    }
}

class KView {
    var origin = KOffset()
    var size = KSize()

    static func == (lhs: KView, rhs: KView) -> Bool {
        return lhs.origin == rhs.origin && lhs.size == rhs.size
    }

    static func != (lhs: KView, rhs: KView) -> Bool {
        return lhs.origin != rhs.origin && lhs.size != rhs.size
    }
}


let offset = KOffset(x: -100, y: 200)
let newOffset = -offset
print(newOffset)


var boxSize = KSize(width: 100, height: 200)
let newSize = ++boxSize
print(newSize)
print(boxSize)


//var anotherSize = boxSize++
//print(anotherSize)
//print(boxSize)


var roomSwitch = KSwitch.on
print(roomSwitch.rawValue)

roomSwitch.push()
print(roomSwitch.rawValue)

roomSwitch.push()
print(roomSwitch.rawValue)

roomSwitch.push()
print(roomSwitch.rawValue)


let size1 = KSize(width: 50, height: 100)
let size2 = KSize(width: 100, height: 200)

var newSize_1 = size1 + size2
print(newSize_1)

newSize_1 = newSize_1 * 2.5
print(newSize_1)


var size_1 = KSize(width: 50, height: 100)
size_1 += KSize(width: 100, height: 200)
print(size_1)


var view1 = KView()
var view2 = KView()

if view1 == view2 {
    print("equal")
} else {
    print("not equal")
}



























let testF = 0

