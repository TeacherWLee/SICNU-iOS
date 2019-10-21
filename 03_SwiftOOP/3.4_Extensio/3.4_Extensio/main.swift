//
//  main.swift
//  3.4_Extensio
//
//  Created by 李巍 on 2019/9/22.
//  Copyright © 2019 LiWei. All rights reserved.
//

import Foundation


// --------------------------------------------------
// 扩展自定义类
class Person {
    var firstName = "Wei"
    var lastName = "Li"
    var age: Int
    
    init(age: Int) {
        self.age = age
    }
}

extension Person {
    var fullName: String {      // 扩展计算属性
        return lastName + " " + firstName
    }
    func getAge() -> Int {      // 扩展方法
        return age
    }
    
    subscript(i: Int) -> String {
        if i == 0 {
            return firstName
        } else if i == 1 {
            return lastName
        } else {
            return "Error index."
        }
    }
    
    convenience init(fn: String, ln: String, age: Int) {
        self.init(age: age)
        firstName = fn
        lastName = ln
    }
}

var p = Person(age: 35)
print(p.fullName)
print(p.getAge())
print(p[0])

var p2 = Person(fn: "XK", ln: "C", age: 30)
print(p2.fullName)
print(p2.getAge())





