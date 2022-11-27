import UIKit

// 06.제어문, 조건문

func fetchData(param: [String: Any]) throws {

    guard let id = param["id"] as? String else {
        print("test#1")
        return
    }

    let urlStr = "https://apple.com/"
    guard let url = URL(string: urlStr) else {
        print("test#2 = \(id)")
        return
    }

    guard let result = try? String(contentsOf: url) else {
        print("test3")
        return
    }

    print(result)
}


do {
    try fetchData(param: ["id": "target"])
} catch {

}


let number = 3
switch number {
case 0, 1, 2:
    print("A")
case 3, 4, 5:
    print("B")
default:
    print("C")
}

let number_1 = 30
switch number {
case 0...2:
    print("A")
case 3...50:
    print("B")
default:
    print("C")
}
