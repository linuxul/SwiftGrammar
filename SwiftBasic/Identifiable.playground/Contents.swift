import UIKit

// Identifiable
// 인스턴스가 안정적인 ID를 가진 엔티티의 값을 보유하는 유형의 클래스입니다.

// protocol Identifiable<ID>


struct Student: Identifiable {
    var id = UUID()
    var name: String
}

//var studentStruct = Student(id: <#T##UUID#>, name: <#T##String#>)

var student_1 = Student(name: "학생1")
var student_2 = Student(name: "학생2")
var student_3 = Student(name: "학생3")
var student_4 = Student(name: "학생4")

print("student = \(student_1)")

var studnets = [student_1, student_2, student_3, student_4]

print("studnets = \(studnets)")

//struct Teacher: Identifiable {
//    var id: ObjectIdentifier = UUID()
//}



