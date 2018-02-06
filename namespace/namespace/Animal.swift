//
//  Animal.swift
//  namespace
//
//  Created by 刘强 on 2018/2/6.
//  Copyright © 2018年 刘强. All rights reserved.
//

import Foundation

extension engine.ps
{
    
    class Animal:Speak
        {
        func Speak() {
            print("Animal Speak")
        }
            func GetName() -> String
            {
                return "Animal"
            }
            func Sleep()
            {
                print("Animal sleep")
            }
            
            //static func
            class func Walk()
            {
                print("Animal Walk")
            }
        }
    
}
