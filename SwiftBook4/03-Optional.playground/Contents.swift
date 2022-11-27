import UIKit

// 03. 옵셔널

var optionalStr: String? = "hello"
print("optionalString = \(optionalStr)")


// Optional Binding

if optionalStr != nil {
    print(optionalStr!)
} else {
    print("empty")
}

if let str = optionalStr {
    print(str)
}

if var strData = optionalStr {
    strData += " swift !!"
    print(strData)
}

let name: String? = "John doe"
let point: Int? = 1200

if let name = name {
    if let p = point {
        if p > 1000 {
            print("\(name), Gold Membership")
        }
    }
}

if let name = name, let p = point, p > 1000 {
    print("\(name), Gold Membership")
}


