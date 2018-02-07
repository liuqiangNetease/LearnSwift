//
//  ViewController.swift
//  Calculator
//
//  Created by 刘强 on 2018/2/7.
//  Copyright © 2018年 刘强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    
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
    
    @IBOutlet weak var display: UILabel!
    
    var userIsIntheMiddleOfTypingANumber: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

