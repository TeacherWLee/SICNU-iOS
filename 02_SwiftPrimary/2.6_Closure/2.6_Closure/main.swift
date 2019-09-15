//
//  main.swift
//  2.6_Closure
//
//  Created by 李巍 on 2019/9/11.
//  Copyright © 2019 李巍. All rights reserved.
//

import Foundation

// ---------------------------------------------------------
// 闭包基础知识
// 1. 闭包可以理解为无名函数，其实例如下。不带参数的闭包
func fun() {
    print("这是一个函数")
}
var f1 = fun
f1()

var b1 = {
    print("这是一个闭包")
}
b1()


// 2. 带参数的闭包，参数的闭包，使用关键字 in 分隔参数与闭包体
var b2 = {
    (param: String) in
    print("闭包参数是：\(param)")
}
b2("你好")


// 3. 带参数和返回值的闭包
var b3 = {
    (param: String) -> String in
    return "闭包参数是：\(param)"
}
let rst3 = b3("你好")
print("闭包返回值是：\(rst3)")


// 4. 闭包可自带参数
var b4 = {
    (p1: String, p2: String) -> String in
    return p1+p2
}("Hello", "Wrold")
print(b4)


// 5. 闭包简化1，自动推导参数和返回值类型 可以根据参数推断。
var s1 = {
    (p1, p2) in
    return p1+p2
}("Hello", "Wrold")
print(s1)


// 6. 闭包简化2，如果函数体只包含一句 return 代码，可省略 return
var s2 = {
    (p1, p2) in
    p1+p2
}("Hello", "Wrold")
print(s2)


// 7. 闭包简化3，参数名称简写，可通过$0$1...引用闭包参数值
var s3 = {
    $0+$1
}("Hello", "Wrold")
print(s3)


// --------------------------------------------------------
// 带有闭包参数的函数和尾随闭包
// 1. 第1和2个参数是整数，第3个参数是闭包进行数学计算，返回计算结果

func myOperation(a: Int , b: Int, operation: (Int , Int) -> Int) -> Int {
    let res = operation(a, b)
    return res
}

//实现一个闭包
let multipyClosure = {
    (a: Int, b: Int) in
    a * b
}

// 简化
//let multipyClosure:(Int, Int) -> Int = {
//    $0 * $1
//}

//将闭包作为参数传递
var rst = myOperation(a: 4, b: 2, operation: multipyClosure)
print(rst)


// 不定义闭包变量，直接使用inline展开
rst = myOperation(a: 3, b: 3, operation: { (a, b) -> Int in
    a * b
})
print(rst)


// 简化
rst = myOperation(a: 4, b: 4, operation: {
    $0 * $1
})
print(rst)


// 尾随闭包，如果闭包是作为函数的最后一个参数，可以将闭包后置到函数体外部
rst = myOperation(a: 5, b: 5) {
    $0 * $1
}
print(rst)


// -------------------------------------------------------------
// 闭包在集合中的应用

// 数组提供了一个排序函数，sorted().使用的是默认规则，当然我们也可以定制排序规则。

let names = ["LiWei", "MaYun", "Bob", "ZhouXingChi", "W"]
let rst4 = names.sorted()
print(rst4)

//更改排序规则 其实就是利用了函数重载，具体可看函数定义
//sorted(by: <#T##(String, String) throws -> Bool#>)
//
let rst5 = names.sorted {
    $0.count > $1.count
}
print(rst5)

