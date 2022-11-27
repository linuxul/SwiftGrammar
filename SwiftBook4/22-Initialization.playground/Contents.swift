import UIKit

// 22.생성자와 소멸자

class Person {
    var name: String
    var age: Int
    var portrait: Date?

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    required init() {
        print("Person required init")
        self.name = "default Name"
        self.age = 0
    }


    func sayHello() {
        print("Hello, World!!. I'm \(name)")
    }

    deinit {
        print("Person deinit")
    }
}

class SuperHero: Person {
    var secretary: String?

    required init() {
        print("SuperHero required init")
        self.secretary = "secretary"
        super.init()
    }

    init(heroName: String, secretaryName: String? = nil) {
        self.secretary = secretaryName
        super.init(name: heroName, age: -1)
    }

    convenience init?(dict: [String: String]) {
        guard let name = dict["name"] else {
            return nil
        }
        guard let secretary = dict["secretary"] else {
            return nil
        }

        self.init(heroName: name, secretaryName: secretary)
    }

    deinit {
        print("SuperHero deinit")
    }

    func callSecretary() {
        if let name = secretary {
            print("Hey, \(name)")
        } else {
            print("\(name) is working alone.")
        }
    }

    func attack(weapon: String, target: String?) -> Bool {
        if let target = target {
            callSecretary()
            print("Attact \(target) with \(weapon)!!!")
            return true
        }

        return false
    }
}

let dict = ["name": "Iron Man", "secretary": "Jarvis"]
if let ironMan = SuperHero(dict: dict) {
    print(ironMan.name)
}

var emptyHero: SuperHero? = SuperHero()
print(emptyHero?.name)

emptyHero = nil

