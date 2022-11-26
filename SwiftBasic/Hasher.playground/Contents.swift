import UIKit

// Hasher
// Set및 에서 사용하는 범용 해시 함수 Dictionary입니다.

var hasher = Hasher()
hasher.combine(23)
hasher.combine("Hello")
let hashValue = hasher.finalize()

print("haser = \(hasher)")
print("hashValue = \(hashValue)")




var test = 0



