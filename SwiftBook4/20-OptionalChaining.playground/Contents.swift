import UIKit

// 20.옵셔널 체이닝


class Person {
    var contact: Contact?

    init() {
        contact = Contact()
    }
}

class Contact {
    var address: String?
    var tel: String?
    var email: String?
}

let person = Person()
var email = person.contact?.email
print(email)

if let contact = person.contact {
    if let email = contact.email {
        print(email)
    } else {
        print("email nil.")
    }
} else {
    print("contact nil.")
}

person.contact?.email = "john@gmail.com"
print(person.contact?.email)






















