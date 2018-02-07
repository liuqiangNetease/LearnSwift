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
    
    var operandStack = Array<Double>()
    
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
        operandStack.append(displayValue)
        print(operandStack)
    }
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        switch operation {
//        case "✖️": performOperation( operation: Multiply)
//        case "✖️": performOperation( operation:{(op1, op2) in return op1 * op2} )
//        case "➗": performOperation( operation:{(op1, op2) in return op1 / op2} )
//            case "➕": performOperation( operation:{(op1, op2) in return op1 + op2} )
//            case "➖": performOperation( operation:{(op1, op2) in return op1 - op2} )
            
//        case "✖️": performOperation { $0 * $1 }
//        case "➗": performOperation { $1 / $0 }
//        case "➕": performOperation { $0 + $1 }
//        case "➖": performOperation { $1 - $0 }
            
        case "✖️": performOperation() { $0 * $1 }
        case "➗": performOperation { $1 / $0 }
        case "➕": performOperation { $0 + $1 }
        case "➖": performOperation { $1 - $0 }
        case "✔️": performOperation { sqrt($0)}
        default:
            break;
        }
    }
    
    func performOperation( operation1: (Double) ->Double)
    {
        if operandStack.count >= 1
        {
            displayValue = operation1(operandStack.removeLast())
            enter()
        }
    }

    
    func performOperation( operation2: (Double, Double) ->Double)
    {
        if operandStack.count >= 2
        {
            displayValue = operation2(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func Multiply(op1: Double, op2: Double) ->Double
    {
        return op1 * op2
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

