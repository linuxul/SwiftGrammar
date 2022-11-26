import UIKit

// 30.어휘 구조 (Lexical Structure)


// 리터럴 (Literals)
42               // Integer literal
3.14159          // Floating-point literal
"Hello, world!"  // String literal
/Hello, .*/      // Regular expression literal
true             // Boolean literal


// 문자열 리터럴 (String Literals)
"1 2 3"
"1 2 \("3")"
"1 2 \(3)"
"1 2 \(1 + 2)"
let x = 3; "1 2 \(x)"


let string = #"\(x) \ " \u{2603}"#
let escaped = "\\(x) \\ \" \\u{2603}"
print(string)
// Prints "\(x) \ " \u{2603}"
print(string == escaped)
// Prints "true"


print(###"Line 1\###nLine 2"###) // OK
print(# # #"Line 1\# # #nLine 2"# # #) // Error


let textA = "Hello " + "world"
let textB = "Hello world"


// 정규 표현식 리터럴 (Regular Expression Literals)
let regex1 = ##/abc/##       // OK
let regex2 = # #/abc/# #     // Error


