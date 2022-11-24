import UIKit

// 03.문자열과 문자 (Strings and Characters)

// 문자열 리터럴 (String Literals)
let someString = "Some string literal value"


// 여러줄 문자열 리터럴 (Multiline String Literals)
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""


let singleLineString = "These are the same."
let multilineString = """
These are the same.
"""


let softWrappedQuotation = """
The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."
"""


let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""


// 문자열 리터럴에 특수 문자 (Special Characters in String Literals)
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496


let threeDoubleQuotationMarks = """
Escaping the first quotation mark \""
Escaping all three quotation marks \"\"\"
"""


// 확장된 문자열 구분기호 (Extended String Delimiters)
let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#


// 빈 문자열 초기화 (Initializing an Empty String)
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other


if emptyString.isEmpty {
    print("Nothing to see here")
}
// Prints "Nothing to see here"


// 문자열 변경 (String Mutability)
var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"

let constantString = "Highlander"
// constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified


// 문자 작업 (Working with Characters)
for character in "Dog!🐶" {
    print(character)
}
// D
// o
// g
// !
// 🐶


let exclamationMark: Character = "!"


let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"


// 문자열과 문자 연결 (Concatenating Strings and Characters)
let string1 = "hello"
let string2 = " there"
var welcomeValue = string1 + string2
// welcome now equals "hello there"


var instruction = "look over"
instruction += string2
// instruction now equals "look over there"


var instructionValue = "look over"
instructionValue += string2
// instruction now equals "look over there"


let badStart = """
one
two
"""
let end = """
three
"""
print(badStart + end)
// Prints two lines:
// one
// twothree

let goodStart = """
one
two

"""
print(goodStart + end)
// Prints three lines:
// one
// two
// three


// 문자열 삽입 (String Interpolation)
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"


print(#"Write an interpolated string in Swift using \(multiplier)."#)
// Prints "Write an interpolated string in Swift using \(multiplier)."


print(#"6 times 7 is \#(6 * 7)."#)
// Prints "6 times 7 is 42."


// 확장된 문자소 클러스터 (Extended Grapheme Clusters)
let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by
// eAcute is é, combinedEAcute is é


let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한


let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is é⃝


let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS is 🇺🇸


// 문자 카운팅 (Counting Characters)
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.count) characters")
// Prints "unusualMenagerie has 40 characters"


var word = "cafe"
print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.count)")
// Prints "the number of characters in café is 4"


// 문자열 인덱스 (String Indices)
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
// G
greeting[greeting.index(before: greeting.endIndex)]
// !
greeting[greeting.index(after: greeting.startIndex)]
// u
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]
// a


//greeting[greeting.endIndex] // Error
//greeting.index(after: greeting.endIndex) // Error


for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}
// Prints "G u t e n   T a g ! "


// 삽입과 삭제 (Inserting and Removing)
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"

welcome.insert(contentsOf: " there", at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"


welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"


// 부분 문자열 (Substrings)
let greetingValue = "Hello, world!"
let indexValue = greetingValue.firstIndex(of: ",") ?? greetingValue.endIndex
let beginning = greetingValue[..<indexValue]
// beginning is "Hello"

// Convert the result to a String for long-term storage.
let newString = String(beginning)


// 문자열과 문자 동등성 (String and Character Equality)
let quotationValue = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotationValue == sameQuotation {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"


// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// Prints "These two strings are considered equal"


let latinCapitalLetterA: Character = "\u{41}"

let cyrillicCapitalLetterA: Character = "\u{0410}"

if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}
// Prints "These two characters are not equivalent."


// 접두사와 접미사 동등성 (Prefix and Suffix Equality)
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]


var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"


var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"

let dogString = "Dog‼🐶"


// UTF-8 표현 (UTF-8 Representation)
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 226 128 188 240 159 144 182 "


// UTF-16 표현 (UTF-16 Representation)
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "


for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "


for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶


