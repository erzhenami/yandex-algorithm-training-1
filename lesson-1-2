// Задача 2. Найти максимум последовательности

import Foundation

let s = readLine()!.components(separatedBy: " ").map({ Int($0)! })

if s.count == 0 {
    print("-inf")
} else {
    var max = s[0]
    for i in 1..<s.count {
        if s[i] > max {
            max = s[i]
        }
    }
    print("\(max)")
}
