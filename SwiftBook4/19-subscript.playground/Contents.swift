import UIKit

// 19.서브스크립트


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


class Headquarters {
    private var squad: [SuperHero]

    init(heros: [SuperHero]) {
        squad = heros
    }

    subscript(index: Int) -> SuperHero? {
        get {
            if index < squad.count {
                return squad[index]
            }
            return nil
        }
        set {
            if let hero = newValue {
                if index < squad.count {
                    squad[index] = hero
                } else {
                    squad.append(hero)
                }
            } else {
                if index < squad.count {
                    squad.remove(at: index)
                }
            }
        }
    }

    subscript(key: String) -> SuperHero? {
        get {
            for hero in squad {
                if hero.name == key {
                    return hero
                }
            }
            return nil
        }
        set {
            if let index = squad.firstIndex(where: { $0.name == key }) {
                if let hero = newValue {
                    squad[index] = hero
                } else {
                    squad.remove(at: index)
                }
            } else {
                if let hero = newValue {
                    squad.append(hero)
                }
            }
        }
    }

    func printSquad() {
        var list = [String]()
        for hero in squad {
            list.append(hero.name)
        }
        print(list.joined(separator: ", "))
    }
}

let ironMan = SuperHero(heroName: "Iron Man", secretaryName: "Jarvis")
let thor = SuperHero(heroName: "Thor")
let captainAmerica = SuperHero(heroName: "Captain America")

let shieldHero = Headquarters(heros: [ironMan, thor])
shieldHero.printSquad()

var firstHero = shieldHero[0]
print(firstHero?.name)

shieldHero[0] = captainAmerica
firstHero = shieldHero[0]
print(firstHero?.name)


var hero = shieldHero["Iron Man"]
print(hero?.name)

shieldHero["Iron Man"] = ironMan
hero = shieldHero["Iron Man"]
print(hero?.name)

shieldHero.printSquad()
shieldHero[0] = nil
shieldHero.printSquad()

shieldHero["Thor"] = nil
shieldHero.printSquad()


