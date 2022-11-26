import UIKit

// 13.상속 (Inheritance)


// 기본 클래스 정의 (Defining a Base Class)
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}


let someVehicle = Vehicle()


print("Vehicle: \(someVehicle.description)")
// Vehicle: traveling at 0.0 miles per hour


// 하위 클래스 (Subclassing)
class SomeSubclass: SomeSuperclass {
    // subclass definition goes here
}


class Bicycle: Vehicle {
    var hasBasket = false
}


let bicycle = Bicycle()
bicycle.hasBasket = true


bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
// Bicycle: traveling at 15.0 miles per hour


class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}


let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")
// Tandem: traveling at 22.0 miles per hour


// 메서드 재정의 (Overriding Methods)
class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}


let train = Train()
train.makeNoise()
// Prints "Choo Choo"


// 프로퍼티 getter와 setter 재정의 (Overriding Property Getters and Setters)
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}


let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// Car: traveling at 25.0 miles per hour in gear 3


// 프로퍼티 관찰자 재정의 (Overriding Property Observers)
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}


let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4






































