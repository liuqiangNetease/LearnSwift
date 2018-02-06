//
//  main.swift
//  CommandLineHello
//
//  Created by 刘强 on 2018/2/5.
//  Copyright © 2018年 刘强. All rights reserved.
//

import Foundation

//1 helloworld
print("Hello, World!")

//变量
var a = 1
a = 10
var b = 2
let c = a+b //c是常量
print(c)

//字符串连接
var str = "Hello "
str = str + "world"
print(str)

var i = 200
str = "\(str): liuqiang: \(i)"
print(str)

//数组
var arr = ["liuqiang","hello"]
print(arr)

//var arr1 = []
//var arr2 = String[]() //类型为string的空数组

//字典dic
var dict = ["name":"liuqiang", "age":"38"]
dict["sex"] = "Male"
print(dict)
print(dict["name"])

////循环
//var indexs = String[]()
//for index in 0..100
//{
//    indexs.append("Item \(index)")
//}
//print(indexs)
//
//for value in indexs
//{
//    print(value)
//}
//
//var i = 0
//while i< indexs.count {
//
//    print(indexs[i])
//    i++
//}

for (key, value) in dict
{
    print("\(key),\(value)")
}

//if 可选变量
var myName:String?="liuqiang"
if let name = myName
{
    print("Hello \(name)")
}
