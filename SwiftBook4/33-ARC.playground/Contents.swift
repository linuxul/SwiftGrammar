import UIKit

// 03.Automatic Reference Counting

//class Person {
//    var name = "John"
//    var car: Car?
//
//    deinit {
//        print("\(name) deinitial")
//    }
//}
//
//class Car {
//    var model: String
//    var lessee: Person?
//
//    init(model: String) {
//        self.model = model
//    }
//
//    deinit {
//        print("\(model) deinitial")
//    }
//}
//
//
//var person1: Person?
//var person2: Person?
//var person3: Person?
//
//person1 = Person()
//
//person2 = person1
//person3 = person1
//
//person1 = nil
//person2 = nil
//person3 = nil
//
//
//var person: Person? = Person()
//var rentedCar: Car? = Car(model: "Porsche 911")
//
//person!.car = rentedCar
//rentedCar!.lessee = person
//
//person = nil
//rentedCar = nil

//class Person {
//    var name = "John"
//    var car: Car?
//
//    deinit {
//        print("\(name) deinitial")
//    }
//}
//
//class Car {
//    var model: String
//    weak var lessee: Person?
//
//    init(model: String) {
//        self.model = model
//    }
//
//    deinit {
//        print("\(model) deinitial")
//    }
//}
//
//
//var person: Person? = Person()
//var rentedCar: Car? = Car(model: "Porsche 911")
//
//person!.car = rentedCar
//rentedCar!.lessee = person
//
//person = nil
//rentedCar = nil


class Person {
    var name = "John"
    var fitnessMembership: Membership?

    deinit {
        print("\(name) deinitial")
    }
}

class Membership {
    let membershipId: String
    unowned var owner: Person

    init(owner: Person) {
        self.owner = owner
        self.membershipId = "123433"
    }

    deinit {
        print("\(membershipId) membership deinitial")
    }
}

var person: Person? = Person()
person!.fitnessMembership = Membership(owner: person!)

person = nil


class Car {
    var totalDrivingDistance: Double = 0.0
    var totalUsedGas: Double = 0.0

    lazy var gasMileage: Double {
        return self.totalDrivingDistance / self.totalUsedGas
    }

    func drive() {
        self.totalDrivingDistance = 1200.0
        self.totalUsedGas = 73.0
    }

    deinit {
        print("Car is deinitialized")
    }
}










let test = 0
