/*

Задача G. Детали

Имеется N кг металлического сплава. Из него изготавливают заготовки массой K кг каждая. После этого из каждой заготовки вытачиваются детали массой M кг каждая (из каждой заготовки вытачивают максимально возможное количество деталей). Если от заготовок после этого что-то остается, то этот материал возвращают к началу производственного цикла и сплавляют с тем, что осталось при изготовлении заготовок. Если того сплава, который получился, достаточно для изготовления хотя бы одной заготовки, то из него снова изготавливают заготовки, из них – детали и т.д. Напишите программу, которая вычислит, какое количество деталей может быть получено по этой технологии из имеющихся исходно N кг сплава.

Формат ввода

Вводятся N, K, M. Все числа натуральные и не превосходят 200.

Формат вывода

Выведите одно число — количество деталей, которое может получиться по такой технологии.

*/

import Foundation

let measures = readLine()!.components(separatedBy: " ").map({ Int($0)! })
let n = measures[0]
let k = measures[1]
let m = measures[2]

var remainder = n
var numDetails = 0

func makeDetails() -> Int {
    if m > k {
        return 0
    }

    while remainder >= k {
        
        let numBillets = remainder / k
        
        for _ in 1...numBillets {
            let detailsMade = k / m
            numDetails += detailsMade
            remainder -= detailsMade * m
        }
    }
    return numDetails
}

print("\(makeDetails())")