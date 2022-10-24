import UIKit

let num: Double = 0

var num2 = num as? Int

print(num)
print(num2)

if let a = num as? Int {
    print(a)
} else {
    print("fail")
}

