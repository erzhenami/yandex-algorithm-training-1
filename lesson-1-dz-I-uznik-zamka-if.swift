/*

Задача I

За многие годы заточения узник замка Иф проделал в стене прямоугольное отверстие размером D × E. Замок Иф сложен из кирпичей, размером A × B × C. Определите, сможет ли узник выбрасывать кирпичи в море через это отверстие, если стороны кирпича должны быть параллельны сторонам отверстия.

Формат ввода
Программа получает на вход числа A, B, C, D, E.

Формат вывода
Программа должна вывести слово YES или NO.

*/

import Foundation

var a = Int(readLine()!)!
var b = Int(readLine()!)!
var c = Int(readLine()!)!
var d = Int(readLine()!)!
var e = Int(readLine()!)!

(a, b) = sort2(a, b)
(b, c) = sort2(b, c)
(a, b) = sort2(a, b)
(d, e) = sort2(d, e)

if a <= d && b <= e {
	print("YES")
} else {
	print("NO")
}

func sort2(_ first: Int, _ second: Int) -> (Int, Int) {
    if first < second {
        return (first, second)
    }
    return (second, first)
}