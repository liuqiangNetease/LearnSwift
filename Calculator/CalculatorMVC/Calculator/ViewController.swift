//
//  ViewController.swift
//  Calculator
//
//  Created by 刘强 on 2018/2/7.
//  Copyright © 2018年 刘强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsIntheMiddleOfTypingANumber: Bool = false
    
    var brain = CalculatorBrain()
    
    var displayValue: Double
    {
        get{
            return NumberFormatter().number(from: display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsIntheMiddleOfTypingANumber = false
        }
    }
    @IBAction func appendDigit(_ sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsIntheMiddleOfTypingANumber
        {
            display.text = display.text! + digit
        }
        else{
            display.text = digit
            userIsIntheMiddleOfTypingANumber = true
        }
        //print("digit = \(digit)")
    }
    
    @IBAction func enter() {
        userIsIntheMiddleOfTypingANumber = false
      
        if let result = brain.pushOperand( operand: displayValue)
        {
            displayValue = result
        }
        else
        {
            displayValue = 0
        }
    }
    
    @IBAction func operate(_ sender: UIButton) {
        if userIsIntheMiddleOfTypingANumber{
            enter()
        }
        if let operation = sender.currentTitle
        {
            if let result = brain.performOperation(symbol: operation)
            {
                displayValue = result
            }
            else
            {
                displayValue = 0
            }
        }
      
    }
    
    

}

