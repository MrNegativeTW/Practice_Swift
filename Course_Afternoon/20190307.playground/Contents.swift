func add(x:Int, y:Int)->Int{
    return x + y
}

var aa = add(x: 1, y: 2)

var number={(x:Int, y:Int)->Int in
    return x + y
}
number(1, 2)


func welcome(){
    print("Welcome!")
}
welcome()



/* --- */
func comfunc(x:Int, y:Int, method:(Int,Int)->Int)->Int{
    return method(x,y)
}

func add2(x:Int, y:Int)->Int{
    return x + y
}

func multipy(x:Int, y:Int)->Int{
    return x * y
}

let a=comfunc(x:9, y:3, method:add2)
let b=comfunc(x:9, y:3, method:multipy)
