// Задача 3. Найдите все корни уравнения a*x^2 + b*x + c = 0 
// и выведите их в порядке возрастания

import Foundation
import Swift

let s = readLine()!.components(separatedBy: " ").map({ Int($0)! })
let a = s[0]
let b = s[1]
let c = s[2]

if a == 0 {
    if b != 0 {
        let r = -c/b
        print("\(r)")
    } 
    if b == 0 && c == 0 {
        print("Infinite number of solutions")
    }
} else {
    let d = pow(Decimal(b), 2) - Decimal(4 * a * c)
    let root = Double(d as NSNumber).squareRoot()
    if d == 0 {
        let x = -b/(2*a)
        print(String(format: "%.1f", Double(x)))
    } else if d > 0 {
        let x1 = (Double(-b) - root) / Double(2*a)
        let x2 = (Double(-b) + root) / Double(2*a)
        let x1s = String(format: "%.1f", x1)
        let x2s = String(format: "%.1f", x2)
        if x1 < x2 {
            print("\(x1s) \(x2s)")
        } else {
            print("\(x2s) \(x1s)")
        }
    }
}
