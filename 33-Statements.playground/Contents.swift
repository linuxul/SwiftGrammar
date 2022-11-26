import UIKit

// 33.구문 (Statements)


case let (x, y) where x == y:


// 향후 열거형 케이스 전환 (Switching Over Future Enumeration Cases)
let representation: Mirror.AncestorRepresentation = .generated
switch representation {
case .customized:
    print("Use the nearest ancestor’s implementation.")
case .generated:
    print("Generate a default mirror for all ancestor classes.")
case .suppressed:
    print("Suppress the representation of all ancestor classes.")
@unknown default:
    print("Use a representation that was unknown when this code was compiled.")
}
// Prints "Generate a default mirror for all ancestor classes."


// Defer 구문 (Defer Statement)
func f() {
    defer { print("First defer") }
    defer { print("Second defer") }
    print("End of function")
}
f()
// Prints "End of function"
// Prints "Second defer"
// Prints "First defer"


// 조건부 컴파일 블럭 (Conditional Compilation Block)
#if compiler(>=5)
print("Compiled with the Swift 5 compiler or later")
#endif
#if swift(>=4.2)
print("Compiled in Swift 4.2 mode or later")
#endif
#if compiler(>=5) && swift(<5)
print("Compiled with the Swift 5 compiler or later in a Swift mode earlier than 5")
#endif
// Prints "Compiled with the Swift 5 compiler or later"
// Prints "Compiled in Swift 4.2 mode or later"
// Prints "Compiled with the Swift 5 compiler or later in a Swift mode earlier than 5"











































