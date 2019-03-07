import UIKit


/* 變數，可以改變 */
var str = "Hello, playground"
str = "Hi there"


/* 常數 無法改變 */
let name = "Tom"
//name = "Casey"


/* 手動指定型態 */
var newStr : String = "Casey"




/* 印出，直接連接 */
print(str + newStr)

/* 印出，中間有空格*/
print(str, newStr)

/* 直接印出 */
print("woo Much Doge", newStr)





/* 自動判別型態 */
var myInt = 87

/* 手動指定型態 - 整數 */
var myInt2: Int = 87

print(myInt - myInt2)

myInt * 100
print("僅改變一次：", myInt)

/* 加法 */
myInt = myInt + 3
print("加法：", myInt)

/* 除法 */
myInt = myInt / 2
print("除法：", myInt)

/* Mod */
myInt = myInt % 4
print("Mod：", myInt)

print("字串中間串數字：Hello \(myInt) World")


var a: Float = 3.14
var b: Double = 3.14159265358979323846
var c = 3.14

/* 改變型態進行運算 */
Double(a) / b


true
false

/* Render: false */
a > Float(c)

/* 現在的 decision 是布林變數 */
var decision = true
print("布林值自動轉字串:", decision)


/* Array */
var myArray = ["Dice1", "Dice2","Dice3","Dice4","Dice5","Dice6"]
print(myArray[5])


/* Dynamic Array */
var dynamicArray = [Int]()

dynamicArray.append(487)
dynamicArray.append(87)
dynamicArray.append(8487)
print(dynamicArray)

dynamicArray.remove(at: 2)
print(dynamicArray)

print(dynamicArray.count)

dynamicArray.sort()
print(dynamicArray)


/* Any Array */
var dictArray = ["Jeff", 170, true] as Any
print(dictArray)
