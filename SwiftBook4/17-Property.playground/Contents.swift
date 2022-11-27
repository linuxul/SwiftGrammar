import UIKit

// 17.속성

struct Contact {
    var email: String?
    var mobile: String?
    var fax: String?

    init() {
        print("new Contact instance")
    }
}

class Person {
    static var sharedValue = 10     // Type Property - 재정의 불가
    class var sharedAge: Int {      // Type Property - 재정의 가능
        return 10
    }

    var name: String = ""           // Stored Property
    var nickName = "Star" {         // Property Observer
        willSet {
            print("current nickName = \(nickName), new nickName = \(newValue)")
        }
        didSet {
            print("current nickName = \(nickName), old nickName = \(oldValue)")
        }
    }

    var birthDate: Date?
    var age: Int {                  // Computed Property
        get {
            if let date = birthDate {
                let calendar = Calendar.current
                let components = calendar.dateComponents([.year], from: date, to: Date())
                return components.year ?? -1
            }
            return -1
        }
        set {
            let calendar = Calendar.current
            birthDate = calendar.date(byAdding: .year, value: newValue * -1, to: Date())
        }
    }


    // Lazy Stored Propery - 선언 부분에서 기본 값을 지정해야 된다. 접근하는 시점에 초기화를 하도록 한다.
    lazy var contacts = Contact()

    init() {
        print("new Person instance")
    }
}

let calendar = Calendar.current
var componets = DateComponents()

componets.year = 1983
componets.month = 3
componets.day = 17

let james = Person()

print(james.name)
print(james.age)

james.contacts.email = "james@gmail.com"

james.birthDate = calendar.date(from: componets)
print(james.age)

james.age = 10
print(james.birthDate)


enum Weekday: Int {
    case sunday = 1
    case monday
    case tuesday
    case wednesday
    case thurday
    case friday
    case saturday

    static var today: Weekday {
        let cal = Calendar.current
        let today = Date()
        let weekday = cal.component(.weekday, from: today)
        return Weekday(rawValue: weekday)!
    }
}

print("week = \(Weekday.today)")

james.nickName = "oldStar"




var test = 0
