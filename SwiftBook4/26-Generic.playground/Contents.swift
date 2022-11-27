import UIKit

// 26.제네릭

struct Color<T: Equatable>: Equatable {
    var red: T
    var green: T
    var blue: T

    static func ==<T>(lhs: Color<T>, rhs: Color<T>) -> Bool {
        return lhs.red == rhs.red &&
            lhs.green == rhs.green &&
            lhs.blue == rhs.blue
    }
}

func compareColor<T: Equatable>(lhs: T, rhs: T) -> Bool {
    return lhs == rhs
}

let black = Color(red: 0, green: 0, blue: 0)
let white = Color(red: 255, green: 255, blue: 255)

let result = compareColor(lhs: black, rhs: white)
print(result)


print(" ")

class Node<T> {
    var value: T?
    var prev: Node<T>?
    var next: Node<T>?

    init(value: T) {
        self.value = value
    }
}


class Queue<T> {
    var length = 0
    var front: Node<T>?
    var rear: Node<T>?

    func isEmpty() -> Bool {
        return length == 0
    }

    func enqueue(_ value: T) {
        let newNode = Node<T>(value: value)

        if self.isEmpty() {
            self.front = newNode
            self.rear = newNode
        } else {
            if let rear = self.rear {
                newNode.prev = rear
                rear.next = newNode
                self.rear = newNode
            }
        }
        self.length += 1
    }

    func dequeue() -> T? {
        if self.isEmpty() {
            return nil
        } else {
            var ret: T? = nil
            if let val = self.front?.value {
                ret = val
            }

            if self.length == 1 {
                self.front = nil
                self.rear = nil
            } else {
                if let node = self.front?.next {
                    node.prev = nil
                    self.front = node
                }
            }

            self.length -= 1
            return ret
        }
    }

    func printQueue() {
        print("Queue : \(self.length)")
        var node = self.front
        while (node != nil) {
            if let value = node?.value {
                print(value)
            }
            node = node?.next
        }
    }
}

let intQueue = Queue<Int>()
let doubleQueue = Queue<Double>()
let stringQueue = Queue<String>()

stringQueue.enqueue("Swift")
stringQueue.printQueue()

stringQueue.enqueue("iOS")
stringQueue.printQueue()

stringQueue.dequeue()
stringQueue.printQueue()


protocol Queueable {
    associatedtype ElementType

    var front: Node<ElementType>? { get set }
    var rear: Node<ElementType>? { get set }

    func isEmpty() -> Bool
    func enqueue(_ value: ElementType)
    func dequeue() -> ElementType?
}

class Person: Equatable {

    var name: String = "John"
    var age = 0

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.name == rhs.name &&
                lhs.age == rhs.age
    }
}

class PersonDataSource: Queueable {
    typealias ElementType = Person

    var length = 0
    var front: Node<Person>? = nil
    var rear: Node<Person>? = nil

    func isEmpty() -> Bool {
        return length == 0
    }

    func enqueue(_ value: Person) {
        let newNode = Node<Person>(value: value)

        if self.isEmpty() {
            self.front = newNode
            self.rear = newNode
        } else {
            if let rear = self.rear {
                newNode.prev = rear
                rear.next = newNode
                self.rear = newNode
            }
        }
        self.length += 1
    }

    func dequeue() -> Person? {
        if self.isEmpty() {
            return nil
        } else {
            var ret: Person? = nil
            if let val = self.front?.value {
                ret = val
            }

            if self.length == 1 {
                self.front = nil
                self.rear = nil
            } else {
                if let node = self.front?.next {
                    node.prev = nil
                    self.front = node
                }
            }

            self.length -= 1
            return ret
        }
    }

    func printQueue() {
        print("Queue : \(self.length)")
        var node = self.front
        while (node != nil) {
            if let value = node?.value {
                print("\(value.name), age = \(value.age)")
            }
            node = node?.next
        }
    }
}

//func matches<Q1: Queueable, Q2: Queueable where Q1.ValueType == Q2.ValueType, Q1.ValueType: Equatable>(lhs: Q1, rhs: Q2) -> Bool {
////    if lhs.length != rhs.length {
////        return false
////    }
//
//    return true
//}


let personQueue = PersonDataSource()
personQueue.enqueue(Person(name: "Tom", age: 10))
personQueue.printQueue()

personQueue.enqueue(Person(name: "Thor", age: 22))
personQueue.printQueue()

personQueue.dequeue()
personQueue.printQueue()





print("test")
