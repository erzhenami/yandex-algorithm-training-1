import Foundation

let a = Int(readLine()!)!
let b = Int(readLine()!)!
let c = Int(readLine()!)!
let d = Int(readLine()!)!
let e = Int(readLine()!)!

if (d >= a && e >= b) || (d >= b && e >= a) || (d >= c && e >= a) || (d >= c && e >= b) {
	print("YES")
} else {
	print("NO")
}