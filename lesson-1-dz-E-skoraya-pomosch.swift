/*

Задача Е. Скорая помощь

Бригада скорой помощи выехала по вызову в один из отделенных районов. К сожалению, когда диспетчер получил вызов, он успел записать только адрес дома и номер квартиры K1, а затем связь прервалась. Однако он вспомнил, что по этому же адресу дома некоторое время назад скорая помощь выезжала в квартиру K2, которая расположена в подъезда P2 на этаже N2. Известно, что в доме M этажей и количество квартир на каждой лестничной площадке одинаково. Напишите программу, которая вычилсяет номер подъезда P1 и номер этажа N1 квартиры K1.

Формат ввода

Во входном файле записаны пять положительных целых чисел K1, M, K2, P2, N2. Все числа не превосходят 106.

Формат вывода

Выведите два числа P1 и N1. Если входные данные не позволяют однозначно определить P1 или N1, вместо соответствующего числа напечатайте 0. Если входные данные противоречивы, напечатайте два числа –1 (минус один).

*/

import Foundation

let info = readLine()!.components(separatedBy: " ").map({ Int($0)! })

var k1 = info[0] // Номер квартиры 1
var m = info[1] // Количество этажей в доме
var k2 = info[2] // Номер квартиры 2
var p2 = info[3] // Номер подъезда 2
var n2 = info[4] // Номер этажа 2

func getEntranceAndFloor(_ flatNum: Int, _ flatsOnFloor: Int, _ floors: Int) -> (Int, Int) {
    
    let floorsBefore = Int(floor(Double((flatNum - 1) / flatsOnFloor)))
    let entrance = Int(floor(Double(floorsBefore / floors)) + 1.0)
    let floor = (floorsBefore % floors) + 1
    
    return (entrance, floor)
}

func check(_ k1: Int, _ m: Int, _ k2: Int, _ p2: Int, _ n2: Int, _ flatsOnFloor: Int) -> (Int, Int) {
    
    let (entrance2, floor2) = getEntranceAndFloor(k2, flatsOnFloor, m)
    
    if entrance2 == p2 && floor2 == n2 {
        return getEntranceAndFloor(k1, flatsOnFloor, m)
    }
    
    return (-1, -1)
}

func slow(_ k1: Int, _ m: Int, _ k2: Int, _ p2: Int, _ n2: Int) -> (Int, Int) {
    var ent = -1
    var floor = -1
    var goodFlag = false
    let maxrandval = 10000
    
    for flatsonfloor in 1...maxrandval {
    
        let (nent, nfloor) = check(k1, m, k2, p2, n2, flatsonfloor)
        
        if nent != -1 {
            goodFlag = true
            if ent == -1 {
                (ent, floor) = (nent, nfloor)
            } else if ent != nent && ent != 0 {
                ent = 0
            } else if floor != nfloor && floor != 0 {
                floor = 0
            }
        }
        
    }
    
    if goodFlag {
        return (ent, floor)
    } else {
        return (-1, -1)
    }
}

let result = slow(k1, m, k2, p2, n2)
print("\(result.0) \(result.1)")