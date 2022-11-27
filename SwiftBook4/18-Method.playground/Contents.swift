import UIKit

// 18.메소드

class SuperHero {
    var name: String
    var secretary: String?

    init(heroName: String, secretaryName: String? = nil) {
        self.name = heroName
        self.secretary = secretaryName
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

let ironMan = SuperHero(heroName: "Iron Man", secretaryName: "Jarvis")
ironMan.callSecretary()
ironMan.attack(weapon: "Repulso Beam", target: "Mandarin")

let thor = SuperHero(heroName: "Thor")
thor.callSecretary()
thor.attack(weapon: "Mj lnir", target: "Laufey")


struct Weapon {
    var name: String
    var durability: Int

    mutating func use() {       // 구조체에서는 내부 변수를 변경하기 위해서는 mutating을 선언해야 된다.
        if durability > 0 {
            durability -= 1
        }
    }

    mutating func switchWeapon(_ name: String, durability: Int = 10) {
        self = Weapon(name: name, durability: durability)
    }
}

var repulsorBeam = Weapon(name: "Repulsor Beam", durability: 10)
repulsorBeam.use()
print(repulsorBeam.durability)

repulsorBeam.use()
print(repulsorBeam.durability)

repulsorBeam.use()
print(repulsorBeam.durability)
print(repulsorBeam)

repulsorBeam.switchWeapon("Mj lnir", durability: 100000)
print(repulsorBeam)


let test = 0
