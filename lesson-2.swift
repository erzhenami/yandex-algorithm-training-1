import Foundation

/*
 Задача 1
 Дана последовательность чисел длиной N. Найти первое (левое) вхождение числа Х в неё или вывести -1, если число не встречалось.
*/

func findFirstEntry(of number: Int, in array: [Int]) -> Int {
    var ans = -1
    
    for i in 0..<array.count {
        if array[i] == number && ans == -1 {
            ans = i
        }
    }
    
    return ans
}


/*
 Задача 2
 Дана последовательность чисел длиной N. Найти последнее (правое) вхождение числа Х в неё или вывести -1, если число не встречалось.
*/

func findLastEntry(of number: Int, in array: [Int]) -> Int {
    var ans = -1
    
    for i in 0..<array.count {
        if array[i] == number {
            ans = i
        }
    }
    
    return ans
}


/*
 Задача 3
 Дана последовательность чисел длиной N (N > 0). Найти максимальное число в последовательности.
*/

func findMax(_ array: [Int]) -> Int {
    var max = array[0]
    for i in 1..<array.count {
        if array[i] > max {
            max = array[i]
        }
    }
    return max
}

func findMax2(_ array: [Int]) -> Int {
    
    var max = 0
    
    for i in 1..<array.count {
        if array[i] > array[max] {
            max = i
        }
    }
    
    return array[max]
    
}


/*
 Задача 4
 Дана последовательность длиной N (N > 1). Найти максимальное число в последовательности и второе по величине число (такое, которое будет максимальным, если вычеркнуть из последовательности одно максимальное число.
 */

func findMaxAndNextMax(_ array: [Int]) -> (Int, Int) {
    
    var max1 = max(array[0], array[1])
    var max2 = min(array[0], array[1])
    
    for i in 2..<array.count {
        if array[i] > max1 {
            max2 = max1
            max1 = array[i]
        } else if array[i] > max2 {
            max2 = array[i]
        }
    }
    
    return (max1, max2)
    
}


/*
 Задача 5
 Дана последовательность чисел длиной N. Найти минимальное четное число в последовательности или вывести -1, если такого не существует.
 */

func findMinEven(_ array: [Int]) -> Int {
    var min = -1
    
    for i in 0..<array.count {
        if array[i] % 2 == 0 && (min == -1 || array[i] < min) {
            min = array[i]
        }
    }
    
    return min
}

func findMinEven2(_ array: [Int]) -> Int {
    var found = false
    var min = -1
    
    for i in 1..<array.count {
        if array[i] % 2 == 0 && (found == false || array[i] < min) {
            min = array[i]
            found = true
        }
    }
    
    return min
}


/*
 Задача 6
 Дана последовательность слов. Вывести самые короткие слова через пробел.
 */

func findShortWords(words: [String]) -> String {
    
    var minLength = words[0].count
    
    for word in words {
        if word.count < minLength {
            minLength = word.count
        }
    }
    
    var ans = [String]()
    
    for word in words {
        if word.count == minLength {
            ans.append(word)
        }
    }
    
    return ans.joined(separator: " ")
}


/*
 Задача 7
 Игра PitCraft проходит в двухмерном мире, который состоит из блоков размером 1 на 1 метр. Остров игрока представляет собой набор столбцов различной высоты, состоящих из блоков камня и окруженный морем. Над островом прошел сильный дождь, который заполнил водой все низины, а не поместившаяся в них вода стекла в море, не увеличив его уровень. По ландшафту острова определите, сколько блоков воды осталось после дождя в низинах на острове.
 */

func isleFlood(_ h: [Int]) -> Int {
    
    var maxPos = 0
    for i in 0..<h.count {
        if h[i] > h[maxPos] {
            maxPos = i
        }
    }
    
    var ans = 0
    var nowm = 0
    
    for i in 0..<maxPos {
        if h[i] > nowm {
            nowm = h[i]
        }
        ans += nowm - h[i]
    }
    
    nowm = 0
    
    for i in stride(from: h.count - 1, to: maxPos, by: -1) {
        if h[i] > nowm {
            nowm = h[i]
        }
        ans += nowm - h[i]
    }
    return ans
}

let isle = [2, 1, 3, 1, 3]
let water = isleFlood(isle)
print("\(water)")

/*
 Задача 8
 Дана строка (возможно, пустая), состоящая из букв A-Z: AAAABBBCCXYZDDDDEEEFFFAAAAAABBBBBBBBBBBBBBBBBBBBBBBBBBBB
 Нужно написать функцию RLE, которая на выходе даст строку вида: A4B3C2XYZD4F3A6B28. И сгенерирует ошибку, если на вход пришла невалидная строка. Пояснения: Если символ встречается 1 раз, он остается без изменений; Если символ повторяется более 1 раза, к нему добавляется количество повторений.
 */

func rle(_ s: String) -> String {
    
    func pack(_ s: Character, _ cnt: Int) -> String {
        if cnt > 1 {
            return "\(s)\(cnt)"
        }
        return String(s)
    }
    
    let array = Array(s)
    var lastSymbol = array[0]
    var lastpos = 0
    var ans = [String]()
    
    for i in 0..<array.count {
        if array[i] != lastSymbol {
            ans.append(pack(lastSymbol, i - lastpos))
            lastpos = i
            lastSymbol = array[i]
        }
    }
    
    ans.append(pack(array[lastpos], array.count - lastpos))
    
    return ans.joined(separator: "")
}

let s = "AAAABBBCCXYZDDDDEEEFFFAAAAAABBBBBBBBBBBBBBBBBBBBBBBBBBBB"
let result = rle(s)
print(result)
