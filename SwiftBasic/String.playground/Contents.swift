import UIKit

// String

var strTitle = "Swift String"

// 첫문자
let firstCh = strTitle[strTitle.startIndex]
print("firstCh = \(firstCh)")

print("startIndex = \(strTitle.startIndex)")
print("endIndex = \(strTitle.endIndex)")
print("strTitle.index(before: strTitle.endIndex) = \(strTitle.index(before: strTitle.endIndex))")

// 마지막 문자
let lastCh = strTitle[strTitle.index(before: strTitle.endIndex)]
print("lastCh = \(lastCh)")

// 두번째 문지
let secondCh = strTitle[strTitle.index(after: strTitle.startIndex)]
print("secondCh = \(secondCh)")

// 세번째 문자
let thirdCh = strTitle[strTitle.index(strTitle.startIndex, offsetBy: 2)]
print("thirdCh = \(thirdCh)")

// 범위
let range_1 = strTitle.startIndex..<strTitle.index(strTitle.startIndex, offsetBy: 5)
print("range_1 = \(range_1)")

let subTitle = strTitle[range_1]
print("subTitle = \(subTitle)")

//for ch in strTitle {
//    print(ch)
//}

// 삽입
strTitle.insert("!", at: strTitle.endIndex)
print("insert = \(strTitle)")

strTitle.insert(contentsOf: "Before ", at: strTitle.startIndex)
print("insert = \(strTitle)")

// 치환
var newTitle = strTitle.replacingOccurrences(of: "Swift", with: "RxSwift")
print("치환 = \(newTitle)")

if strTitle.isEqual(newTitle) {
    print("Equal")
} else {
    print("Not Equal")
}

newTitle = strTitle.replacingOccurrences(of: "Swift", with: "RxSwift", options: [.caseInsensitive], range: strTitle.startIndex..<strTitle.endIndex)
print("치환 = \(newTitle)")

if let replaceRange = strTitle.range(of: "Swift") {
    print("범위 = \(replaceRange)")
    strTitle.replaceSubrange(replaceRange, with: "RxSwift")
}
print("치환 후 = \(strTitle)")

// 특정 범위 삭제
if let deleteRange = strTitle.range(of: "String") {
    strTitle.removeSubrange(deleteRange)
}
print("삭제 후 = \(strTitle)")

let removedCh = strTitle.remove(at: strTitle.startIndex)
print("삭제 후 = \(removedCh)")
print("삭제 후 = \(strTitle)")

let test = 0

// 문자열 추출
if let subRange = strTitle.range(of: "RxSwift") {
//    let subTitle = strTitle.substring(with: subRange)
    let subTitle = strTitle[subRange]
    print("추출 = \(subTitle)")
}

let subTitleRange = strTitle[strTitle.startIndex..<strTitle.index(strTitle.startIndex, offsetBy: 3)]
print("인텍스 추출 = \(subTitleRange)")

// 문자열 분리
var strNumber = "1234567890"
var strList = strNumber.components(separatedBy: "5")

for valueData in strList {
    print("value = \(valueData)")
}

// 문자열 검색
if strTitle.contains("RxSwift") {
    print("RxSwift 포함")
}

if let searchRange = strTitle.range(of: "RxSwift") {
    print("searchRange= \(searchRange)")
}


let resultCompare = strTitle.compare("RxSwift", options: [.caseInsensitive])
print("resultCompare = \(resultCompare)")
if resultCompare == .orderedSame {
    print("String orderedSame")
} else if resultCompare == .orderedAscending {
    print("String orderedAscending")
} else if resultCompare == .orderedDescending {
    print("String orderedDescending")
} else {
    print("Others")
}

// 포맷지정자
var strFormat = String(format: "value is = %ld", 123)
print(strFormat)

strFormat = String(format: "value is = %f", 12.34)
print(strFormat)

strFormat = String(format: "value is = %.3f", 12.341234)
print(strFormat)

strFormat = String(format: "value is = %e", 12.341234)
print(strFormat)

strFormat = String(format: "value is = %u, %U", 1234, 1234)
print(strFormat)

//strFormat = String(format: "value is = %-20s", "ABCDEF".utf8)
//print(strFormat)
//
//strFormat = String(format: "value is = %20s", "ABCDEF".utf8)
//print(strFormat)


// 공백제거
var strResult = " abcd ".trimmingCharacters(in: .whitespacesAndNewlines)
print(strResult)

let emailCharSet = CharacterSet(charactersIn: "@.")

let emailAddress = "user@gmail.com"
let componentsList = emailAddress.components(separatedBy: emailCharSet)
for valueData in componentsList {
    print("value = \(valueData)")
}
