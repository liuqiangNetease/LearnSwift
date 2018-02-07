//
//  ViewController.swift
//  connectLineStoryBoard
//
//  Created by 刘强 on 2018/2/6.
//  Copyright © 2018年 刘强. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var i: UIImageView!
    
    @IBOutlet var lab: [UILabel]!
    
    @IBAction func btnClicked(sender: AnyObject)
    {
        print("Button Clicked")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        i.image = UIImage(named:"1.jpg")
        //self.lab
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

