//
//  ViewController.swift
//  IOSHello
//
//  Created by 刘强 on 2018/2/5.
//  Copyright © 2018年 刘强. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //webview
    @IBOutlet var wv:UIWebView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wv.loadRequest(NSURLRequest(URL:NSURL(string:"http://www.baidu.com")))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

