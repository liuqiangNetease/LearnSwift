//
//  ViewController.swift
//  Card
//
//  Created by 刘强 on 2018/2/7.
//  Copyright © 2018年 刘强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0
    {
        didSet {
            flipCountLabel.text = "Flip: \(flipCount)"
        }
    }
    //@IBOutlet var cardButons: Array<UIButton>!
    @IBOutlet var cardButons: [UIButton]!
    
    //var emojiChoices: Array<String> = ["🐹","☂️","🐹","☂️"]
    var emojiChoices = ["🐹","☂️","🐹","☂️"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
   
    @IBAction func touchCard(_ sender: UIButton) {
        
        flipCount += 1
        //flipCard(withEmoji: "🐹", on: sender)
        if let cardNumber = cardButons.index(of: sender)
        {
            print("cardNumber = \(cardNumber)")
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        else
        {
            print("card was not in cardButons")
        }
        
    }
    
    //withEmoji 形参 external name
    //emoji 实参 internal name
    //String 类型 type
    func flipCard(withEmoji emoji: String, on button: UIButton)
    {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }
        else{
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }

}

