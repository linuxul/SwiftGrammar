import UIKit

// Equatable
// 값이 같은지 비교할 수 있는 형식입니다.

let students = ["Kofi", "Abena", "Efua", "Kweku", "Akosua"]

let nameToCheck = "Kofi"
if students.contains(nameToCheck) {
    print("\(nameToCheck) is signed up!")
} else {
    print("No record of \(nameToCheck).")
}
// Prints "Kofi is signed up!"

class StreetAddress {
    let number: String
    let street: String
    let unit: String?

    init(_ number: String, _ street: String, unit: String? = nil) {
        self.number = number
        self.street = street
        self.unit = unit
    }
}


extension StreetAddress: Equatable {
    static func == (lhs: StreetAddress, rhs: StreetAddress) -> Bool {
        return
            lhs.number == rhs.number &&
            lhs.street == rhs.street &&
            lhs.unit == rhs.unit
    }
}

//extension StreetAddress: Equatable {
//    static func == (lhs: StreetAddress, rhs: StreetAddress) -> Bool {
//        <#code#>
//    }
//}


let addresses = [StreetAddress("1490", "Grove Street"),
                 StreetAddress("2119", "Maple Avenue"),
                 StreetAddress("1400", "16th Street")]
let home = StreetAddress("1400", "16th Street")

print(addresses[0] == home)
// Prints "false"
print(addresses.contains(home))
// Prints "true"


class IntegerRef: Equatable {
    let value: Int
    init(_ value: Int) {
        self.value = value
    }

    static func == (lhs: IntegerRef, rhs: IntegerRef) -> Bool {
        return lhs.value == rhs.value
    }
}

class IntegerTest: Equatable {
    let valueTest: Int
    init(_ valueTest: Int) {
        self.valueTest = valueTest
    }

    static func == (lhs: IntegerTest, rhs: IntegerTest) -> Bool {
        return lhs.valueTest == rhs.valueTest
    }
}

let a = IntegerTest(100)
let b = IntegerTest(101)
let c = IntegerTest(100)

print("a == b => \(a == b)")
print("a == c => \(a == c)")

let d = a
print("d === a => \(d === a)")
print("d === c => \(d === c)")

let arrayA = [IntegerTest(1),
              IntegerTest(2),
              IntegerTest(3),
              IntegerTest(4),
              IntegerTest(5)]

let includeA = IntegerTest(5)


print("includeA = \(arrayA.contains(includeA))")
print("includeA 100 = \(arrayA.contains(IntegerTest(100)))")




