import UIKit
import os

// 14.컬렉션

let friuts = ["Apple", "Orange", "Banana"]
friuts.count

print(friuts[0])
print(friuts[friuts.count - 1])

var nIndex = 10
if nIndex <= friuts.startIndex && nIndex < friuts.endIndex {
    print("Include")
} else {
    print("Exclude")
}

print(friuts.first)
print(friuts.last)

friuts.contains("Test")


var productNames = ["iPhone", "iPad", "Mac Pro", "iPad Pro"]
//var prefixPredicate = NSPredicate(format: "SELF BEGINSWITH %@", "i")
//let filteredNames = productNames.pre

let filtersName = productNames.filter { (element) -> Bool in
    return element.hasPrefix("i")
}
print(filtersName)

if let indexFind = productNames.firstIndex(of: "iPad") {
    print(indexFind)
}


var alphabet = ["A", "B", "C", "D"]
let lower = ["a", "b", "c", "d"]

if alphabet.elementsEqual(lower, by: { $0.lowercased() == $1.lowercased() }) {
    print("equal")
} else {
    print("not equal")
}

alphabet.append("E")

alphabet.insert("a", at: 0)

alphabet[0] = "ZZ"

print(alphabet)

alphabet.replaceSubrange(0..<3, with: ["1", "2", "3"])
print(alphabet)

alphabet.removeLast()
print(alphabet)

alphabet.removeFirst()
print(alphabet)

alphabet.remove(at: 0)
print(alphabet)


alphabet += ["a", "b", "c", "d", "e", "f"]
print(alphabet)

alphabet.reverse()
print(alphabet)

// 범위 추출
var subArray = alphabet[0..<2]
print(subArray)

alphabet.dropFirst()
print(alphabet)

// 메소드는 배열의 시작 인덱스부터 저정한 인덱스 이전까지 요소 추풀
print(alphabet.prefix(upTo: 2))

// 메소드는 배열의 마지막에 위치한 n개의 요소를 새로운 배열로 리턴
print(alphabet.suffix(2))

// 배열을 분리하여 스트링
print(alphabet.joined(separator: " # "))

var resultMap = alphabet.map { "\($0.lowercased()) show" }
print(resultMap)


// 딕션너리

var words = ["A": "Apple", "B": "Banana", "C": "City", "D": "Dart"]

if let aValue = words["A"] {
    print(aValue)
} else {
    print("Not found")
}

words["D"] = "Destory"

if let aValue = words["Z"] {
    print(aValue)
} else {
    print("Not found")
}

let keys = words.keys
print(keys)

let values = words.values
print(values)


if words.contains(where: { (key: String, value: String) in return key == "A" }) {
    print("contains A key.")
}

let resultFilter = words.filter { (key, value) -> Bool in
    return value.lowercased().contains("a")
}

for (key, value) in resultFilter {
    print("\(key) - \(value)")
}



// 셋
var setFruits: Set<String> = ["Apple", "Banana", "Kiwi", "Water"]
var setNumber: Set<Int> = [1, 2, 3, 4, 5, 10, 20, 11]
var setEmpty = Set<String>()

let filterSet = setFruits.filter { $0.hasPrefix("A") }
print(filterSet)

setFruits.insert("Orange")
print(setFruits)

setFruits.insert("Test")
print(setFruits)

setFruits.remove("Test")
print(setFruits)


var favoriteFruits: Set<String> = ["Apple", "Orange", "Melon"]
var tropicalFruits: Set<String> = ["Banana", "Papaya", "Kiwi", "Pineappke"]
var yellowFruits: Set<String> = ["Banana"]

// 집합연산 - 비교 부분집합
// isSubset
if yellowFruits.isSubset(of: tropicalFruits) {
    print("yellowFruits isSubset < tropicalFruits")
} else {
    print("yellowFruits isSubset not < tropicalFruits")
}

// isStrictSubset
if yellowFruits.isStrictSubset(of: tropicalFruits) {
    print("yellowFruits isStrictSubset < tropicalFruits")
} else {
    print("yellowFruits isStrictSubset not < tropicalFruits")
}

// isSuperset
if tropicalFruits.isSuperset(of: yellowFruits) {
    print("tropicalFruits isSuperset < yellowFruits")
} else {
    print("tropicalFruits isSuperset not < yellowFruits")
}

// isStrictSuperset
if tropicalFruits.isStrictSuperset(of: yellowFruits) {
    print("tropicalFruits isStrictSuperset < yellowFruits")
} else {
    print("tropicalFruits isStrictSuperset not < yellowFruits")
}

// 집합연산 - 교집합
// isDisjoint
favoriteFruits = ["Apple", "Orange", "Melon", "Kiwi"]
tropicalFruits = ["Banana", "Papaya", "Kiwi", "Pineappke"]

if favoriteFruits.isDisjoint(with: tropicalFruits) {
    print("favoriteFruits isDisjoint < tropicalFruits")
} else {
    print("favoriteFruits isDisjoint not < tropicalFruits")
}

// intersection
var commonSet = favoriteFruits.intersection(tropicalFruits)
print("intersection = \(commonSet)")

// formIntersection
tropicalFruits.formIntersection(favoriteFruits)
print("formIntersection = \(tropicalFruits)")

// 집합연산 = 합집합
favoriteFruits = ["Apple", "Orange", "Melon", "Kiwi"]
tropicalFruits = ["Banana", "Papaya", "Kiwi", "Pineappke"]

var unionSet = favoriteFruits.union(tropicalFruits)
print("unionSet = \(unionSet)")

unionSet = Set(favoriteFruits)
unionSet.formUnion(tropicalFruits)
print("unionSet = \(unionSet)")


// 집합 연산 - 차집합
favoriteFruits = ["Apple", "Orange", "Melon", "Kiwi"]
tropicalFruits = ["Banana", "Papaya", "Kiwi", "Pineappke"]

var uncommonSet = favoriteFruits.subtracting(tropicalFruits)
print("uncommonSet = \(uncommonSet)")


// 집합 연산 - 여집합
favoriteFruits = ["Apple", "Orange", "Melon", "Kiwi"]
tropicalFruits = ["Banana", "Papaya", "Kiwi", "Pineappke"]

var exclusiveSet = favoriteFruits.symmetricDifference(tropicalFruits)
print("exclusiveSet = \(exclusiveSet)")





let test = 0

