//
//  main.swift
//  3.5_Protocol
//
//  Created by 李巍 on 2019/9/22.
//  Copyright © 2019 LiWei. All rights reserved.
//

import Foundation

/////////////////////////////////////////////////////////////
// 协议基础
protocol ExampleProtocol {
    var simpleDescription: String {get set}
    mutating func adjust()  // 使用 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量
}

class simpleClass: ExampleProtocol {
    var simpleDescription: String = "A very"
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " now 100% adjust"
    }
}
var a = simpleClass()
a.adjust()
print(a.simpleDescription)

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
print(b.simpleDescription)
print("-------------------------------------")




///////////////////////////////////////////////////
// 协议可以当做类型使用
protocol MyRect {
    func myLuckNumber() -> Int
}

class MyRectImp: MyRect {
    func myLuckNumber() -> Int {
        return 6
    }
}

class Dice {
    let sides: Int
    var gener: MyRect
    init(sides: Int, gener: MyRect) {
        self.sides = sides
        self.gener = gener
    }
}

var dice = Dice(sides: 6, gener: MyRectImp())
print(dice.gener.myLuckNumber())
print("-------------------------------------")



