//
//  ViewController.swift
//  SwiftCallOC
//
//  Created by 刘强 on 2018/2/5.
//  Copyright © 2018年 刘强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mName: UILabel!
    @IBOutlet var mImage: [UIImageView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        @IBOutlet weak var mBtn: UIButton!
        
        var h = Hello()
        h.sayHello2()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

