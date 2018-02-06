//
//  main.swift
//  Function
//
//  Created by 刘强 on 2018/2/5.
//  Copyright © 2018年 刘强. All rights reserved.
//

import Foundation

func sayHello(name:String)
{
    print("Hello \(name)")
}

sayHello(name: "liuqiang")

func getNums()->(Int,Int)
{
    return (2,3)
}
let (a,b) = getNums()

print(a)

var fun = sayHello
fun("zhangsan")
