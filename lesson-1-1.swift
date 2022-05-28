// Задача 1. Дана строка (в кодировке UTF-8). 
// Найти самый часто встречающийся в ней символ. Если несколько символов встречаются одинаково часто, то можно вывести любой.
import Foundation

let symbols = Array(readLine()!)

var ans = Character("")
var anscnt = 0

var dct: [Character : Int] = [:]

for symbol in symbols {

    if !dct.keys.contains(symbol) {
        dct[symbol] = 0
    } 
    dct[symbol]! += 1
    
    if dct[symbol]! > anscnt {
        ans = symbol
        anscnt = dct[symbol]!
    }
}

print(ans)
