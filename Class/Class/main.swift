//
//  main.swift
//  Class
//
//  Created by 刘强 on 2018/2/5.
//  Copyright © 2018年 刘强. All rights reserved.
//

import Foundation

class Hi
{
    func sayHi()
    {
        print("hi")
    }
}

class Hello:Hi
{
    var _name:String?="default"
    
    //构造方法
    init(name:String) {
        print("Hello init()")
        _name = name
    }
    override init() {
        
    }
    override func sayHi() {
        print("Hello \(self._name)")
    }
}

var hi = Hi()
hi.sayHi()

var hello = Hello(name: "liuqiang")
hello.sayHi()

var h = Hello()
h.sayHi()

