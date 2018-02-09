//
//  FaceViewController.swift
//  Face
//
//  Created by 刘强 on 2018/2/9.
//  Copyright © 2018年 刘强. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController, FaceDataSourceDelegate {

    @IBOutlet weak var faceView: FaceView!
    {
        didSet{
            faceView.dataSource = self
        }
    }
    
    
    var happiness: Int = 80 { // 0= very sad, 100 = ecstatic
        didSet{
            happiness = min(max(happiness,0),100)
            updateUI();
        }
    }
    
    func updateUI() {
        faceView.setNeedsDisplay()
    }
    
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness-50)/50
    }
}
