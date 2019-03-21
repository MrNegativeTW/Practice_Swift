//: ----
//:  - 換行字元 terminator: ""
//: ----
import Foundation

for _ in 1...50 {
    print("*", terminator: "")
}
print("")

//: ----
//:  - 基本的九九乘法表
//: ----
for i in 1...9 {
    for j in 1...9 {
        print(String(format: " %4d", (i*j)), terminator: "")
    }
    print(" ")
}

//: ----
//:  - 當迴圈變數沒有被使用時可以用 _ 代替
//: ----
for _ in 1...50 {
    print("*", terminator: "")
}
print("")

//: ----
//:  - function沒有參數也沒傳回值
//: ----
import Foundation

func printStar() -> () {
    for _ in 1...50 {
        print("*", terminator: "")
    }
    print(" ")
}

printStar()

for i in 1...9 {
    for j in 1...9 {
        print(String(format: " %4d", (i*j)), terminator: "")
    }
    print(" ")
}
printStar()


//: ----
//:  - function無傳回值可省略 ->()
//: ----
import Foundation

func printStar1() {
    for _ in 1...50 {
        print("*", terminator: "")
    }
    print(" ")
}

func multiply1() {
    for i in 1...9 {
        for j in 1...9 {
            print(String(format: " %4d", (i*j)), terminator: "")
        }
        print(" ")
    }
}

printStar1()
multiply1()
printStar1()


//: ----
//:  - 呼叫函數時要寫參數名稱
//: ----
import Foundation

func printStar2(starNumber: Int) {
    for _ in 1...starNumber {
        print("*", terminator: "")
    }
    print("")
}

func multiply2() {
    for i in 1...9 {
        for j in 1...9 {
            print(String(format: " %4d", (i*j)), terminator: "")
        }
        print("")
    }
}

printStar2(starNumber: 50)
multiply2()
printStar2(starNumber: 50)

//: ----
//:  - function有回傳值
//: ----

func sum(number: Int) -> Int {
    var total = 0
    for i in 1...number {
        total += i
    }
    return total
}
let j = 100
let tot = sum(number: j)
print("1+2+...+\(j) = \(tot)")

//: ----
//:  - function有兩個參數且有回傳值，呼叫時要有參數名稱
//: ----
func sum1(from: Int, to: Int) -> Int {
    var total = 0
    for i in from...to {
        total += i
    }
    return total
}

let a = 1, b=100
let tot1 = sum1(from: a, to: b)
print("\(a)+2...+\(b) = \(tot1)")



//: ----
//:  - functiont有多個回值
//:  - 注意函數回傳值的讀取方式，類似物件屬性的讀取方式
//:  - data.cout表示List中的元素個數
//: ----
func sumAndMean() -> (sum: Int, mean: Int) {
    let data = [1, 2, 3, 4, 5, 6, 7, 8 ,9, 10]
    var sum = 0, mean = 0
    for i in data {
        sum += i
    }
    mean = (sum) / (data.count)
    return (sum, mean)
}

let counter = sumAndMean()
print("sum = \(counter.sum), mean = \(counter.mean)")


//: ----
//:  - functiont有多個回值
//:  - 注意函數回傳值的讀取方式，類似物件屬性的讀取方式
//:  - data.cout表示List中的元素個數
//:  - 資料型態轉換
//: ----
func sumAndMean1() -> (sum: Int, mean: Double) {
    let data = [1, 2, 3, 4, 5, 6, 7, 8 ,9, 10]
    var sum = 0, mean = 0.0
    for i in data {
        sum += i
    }
    mean = Double(sum) / Double(data.count)
    return (sum, mean)
}

let counter1 = sumAndMean1()
print("sum = \(counter1.sum), mean = \(counter1.mean)")



//: ----
//:  - 沒有使用外部變數
//: ----
func sum(n1: Int, n2: Int) -> Int {
    var total = 0
    for i in n1...n2 {
        total += i
    }
    return total
}
let calculate1 = sum(n1: 1, n2: 100)
print(calculate1)



//: ----
//:  - 使用外部參數 external parameter
//:  - sum2(from n1: Int, to n2: Int) from,to 為外部參數
//:  - 呼叫時增加可讀性
//: ----
func sum2(from n1: Int, to n2: Int) -> Int {
    var total = 0
    for i in n1...n2 {
        total += i
    }
    return total
}
let calculate2 = sum2(from: 1, to: 100)
print(calculate2)


//: ----
//:  - sum3(n1: Int, _ n2: Int)
//:  - sum3(n1: 1, 100)  100前面無需參數名稱
//:  - 呼叫時不需要參數名稱
//: ----
func sum3(n1: Int, _ n2: Int) -> Int {
    var total = 0
    for i in n1...n2 {
        total += i
    }
    return total
}
let calculate3 = sum3(n1: 1, 100)
print(calculate3)



//: ----
//:  - 參數有預設值
//: ----
func sum4(from: Int, to: Int = 100) -> Int {
    var total = 0
    
    for i in 1...to {
        total += i
    }
    return total
}
let calculate4 = sum4(from: 1)
print("1加到100的和為: ", terminator: "")
print(calculate4)

let calculate5 = sum4(from: 1, to: 10)
print("1加到10的和為: ", terminator: "")
print(calculate5)

//: ----
//:  - 參數有不確定多數個
//: ----
func sum5(numbers: Int...) -> Int {
    var total = 0
    for i in numbers {
        total += i
    }
    return total
}
let data1 = sum5(numbers: 1, 2, 3, 4, 5)
print("data1 = \(data1)")

let data2 = sum5(numbers: 1, 2, 3)
print("data2 = \(data2)")



//: ----
//:  - swap交換參數,不會成功
//: ----
func swapping(aa: Int, bb: Int) {
    var aa = aa
    var bb = bb
    let temp = aa
    aa = bb
    bb = temp
}

var a1 = 100
var b1 = 200
print("交換前: a1 = \(a1), b = \(b1)")
swapping(aa: a1, bb: b1)
print("交換後: a1 = \(a1), b = \(b1)")


//: ----
//:  - swap交換參數,成功
//:  - 參數型態：inout
//:  - 傳值方式：＆
//: ----
func swap(a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var num1 = 100, num2 = 200
print("交換前: num1 = \(num1), num2 = \(num2)")

swap(&num1, &num2)
print("交換後: num1 = \(num1), num2 = \(num2)")




//: ----
//:  - 變數的型態為函數
//:  - 比較print("result = \(mean1(5,6)")
//: ----
func mean1(data1: Int,  data2: Int) -> Double {
    return Double(data1+data2) / 2
}

var mathFunction: (Int ,Int) -> Double = mean1
print("result: \(mathFunction(5, 6))")


//: ----
//:  - 參數的型態為函數
//: ----
func mean(data1: Int,  data2: Int) -> Double {
    return Double(data1+data2) / 2
}

func printMean(meanFunction: (Int, Int) -> Double, a: Int, b: Int) {
    print("(\(a) + \(b)) / 2 is \(meanFunction(a, b))")
}
printMean(meanFunction: mean, a: 8, b: 7)

//: ----
//:  - 回傳值的型態為函數
//: ----
func incremental(input: Int) -> Int {
    return input + 1
}
func decremental(input: Int) -> Int {
    return input - 1
}

func chooseFunction(increment: Bool) -> (Int)-> Int {
    if increment {
        return incremental
    } else {
        return decremental
    }
}

var number = 6
let moveToZero = chooseFunction(increment: number < 0)
while number != 0 {
    print("\(number) ", terminator: "")
    number = moveToZero(number)
}
print(0)
print("end")
