import Cocoa


/**
 _，不重要的參數
 terminator: ""，不換行
 */
for _ in 1...50 {
    print("*", terminator: "")
}
print("")


/* 回傳多個值 */
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



/**
 外部參數
 from, to
 */
func sum(from n1: Int, to n2: Int) -> Int {
    var total = 0
    for i in n1...n2 {
        total += i
    }
    return total
}
let calculate2 = sum(from: 1, to: 100)
print(calculate2)



//:# 不重要的外部參數
func sum(n1: Int, _ n2: Int) -> Int {
    var total = 0
    for i in n1...n2 {
        total += i
    }
    return total
}
let calculate = sum(n1: 1, 100)
print(calculate)


//:# 交換
//:inout，有進有出

func swap(a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}


var num1 = 100, num2 = 200
print("交換前: num1 = \(num1), num2 = \(num2)")

swap(&num1, &num2)
print("交換後: num1 = \(num1), num2 = \(num2)")


