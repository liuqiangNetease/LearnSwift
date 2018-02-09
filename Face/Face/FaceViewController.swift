//
//  FaceViewController.swift
//  Face
//
//  Created by 刘强 on 2018/2/9.
//  Copyright © 2018年 刘强. All rights reserved.
//

import UIKit

class FaceViewController: UIViewController, FaceDataSourceDelegate {

    private struct Constants{
        static let HappinessGestureScale: CGFloat = 4
    }
    @IBAction func changeHappiness(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .ended: fallthrough
        case .changed:
            let translation = sender.translation(in: faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0{
                happiness += happinessChange
                sender.setTranslation(CGPoint.zero, in: faceView)
            }
            
        default:
            break
        }
    }
    
    
    @IBOutlet weak var faceView: FaceView!
    {
        didSet{
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
            //faceView.addGestureRecognizer(UIPanGestureRecognizer(target: faceView, action: "changeHappiness:"))
            //在控件列表可以找到Pan Gesture Recognizer拖到view中
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
