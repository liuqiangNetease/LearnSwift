//
//  Monkey.swift
//  namespace
//
//  Created by 刘强 on 2018/2/6.
//  Copyright © 2018年 刘强. All rights reserved.
//

import Foundation


extension engine.ps
{
    
        class Monkey: Animal
        {
            override func GetName() -> String {
                return "Monkey"
            }
            override func Sleep()
            {
                super.Sleep()
                print("Monkey sleep")
            }
        }
    
}
