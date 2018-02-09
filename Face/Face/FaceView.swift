//
//  FaceView.swift
//  Face
//
//  Created by 刘强 on 2018/2/9.
//  Copyright © 2018年 刘强. All rights reserved.
//

import UIKit

protocol FaceDataSourceDelegate :class {
    func smilinessForFaceView(sender: FaceView)-> Double?
    
}

@IBDesignable   //使得view在storyboard 可视
class FaceView: UIView {

    @IBInspectable   //使得可以在storyboard设置此属性
    var lineWidth: CGFloat = 3
    {
        didSet
        {
            setNeedsDisplay() //make view redraw
        }
    }
    @IBInspectable
    var color: UIColor = UIColor.blue { didSet{setNeedsDisplay()}}
    @IBInspectable
    var scale: CGFloat = 0.90 {didSet{setNeedsDisplay()}}
    
    
    
    var faceCenter: CGPoint{
        //return center
        return convert(center, from: superview)
    }
    var faceRadius: CGFloat{
        return min(bounds.size.width, bounds.size.height) / 2 * scale
    }
    
    
    weak var dataSource: FaceDataSourceDelegate?
    
    private struct Scaling{
        static let FaceRadiusToEyeRadiusRatio: CGFloat = 10
        static let FaceRadiusToEyeOffsetRatio: CGFloat = 3
        static let FaceRadiusToEyeSeparationRatio: CGFloat = 1.5
        static let FaceRadiusToMouthWidthRatio: CGFloat = 1
        static let FaceRadiusToMouthHeightRatio: CGFloat = 3
        static let FaceRadiusToMouthOffsetRatio: CGFloat = 3
    }
    
    private enum Eye{ case Left, Right}
    
    private func bezierPathForEye(whichEye: Eye)->UIBezierPath
    {
        let eyeRadius = faceRadius / Scaling.FaceRadiusToEyeRadiusRatio
        let eyeVerticalOffset = faceRadius / Scaling.FaceRadiusToEyeOffsetRatio
        let eyeHorizontalSeparation = faceRadius / Scaling.FaceRadiusToEyeSeparationRatio
        
        var eyeCenter = faceCenter
        eyeCenter.y -= eyeVerticalOffset
        switch whichEye {
        case .Left:
            eyeCenter.x -= eyeHorizontalSeparation / 2
        case .Right:
            eyeCenter.x += eyeHorizontalSeparation / 2
        }
        
        let path = UIBezierPath(arcCenter: eyeCenter, radius: eyeRadius, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
        path.lineWidth = lineWidth
        return path
        
    }
    
    private func bezierPathForSmile(fractionOfMaxSmile: Double) -> UIBezierPath
    {
        let mouthWidth = faceRadius / Scaling.FaceRadiusToMouthWidthRatio
        let mouthHeight = faceRadius / Scaling.FaceRadiusToMouthHeightRatio
        let mouthVerticalOffset = faceRadius / Scaling.FaceRadiusToMouthOffsetRatio
        
        let smileHeight = CGFloat( max(min(fractionOfMaxSmile,1),-1)) * mouthHeight
        
        let start = CGPoint( x: faceCenter.x - mouthWidth / 2, y: faceCenter.y + mouthVerticalOffset)
        let end = CGPoint(x: start.x + mouthWidth, y: start.y)
        let cp1 = CGPoint(x:start.x + mouthWidth / 3, y:start.y + smileHeight)
        let cp2 = CGPoint(x:end.x - mouthWidth / 3, y: cp1.y)
        
        let path = UIBezierPath()
        path.move(to: start)
        path.addCurve(to: end, controlPoint1: cp1, controlPoint2: cp2)
        path.lineWidth = lineWidth
        return path
    }
    
    
    
    //不要手动调用draw。 use setNeedsDisplay instead
    override func draw(_ rect: CGRect) {
         let facePath = UIBezierPath(arcCenter: faceCenter, radius: faceRadius, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
        
        facePath.lineWidth = lineWidth
        color.set()
        facePath.stroke()
        
        bezierPathForEye(whichEye: .Left).stroke()
        bezierPathForEye(whichEye: Eye.Right).stroke()
        
        let smiliness = dataSource?.smilinessForFaceView(sender: self) ?? 0.0
        let smilePath = bezierPathForSmile(fractionOfMaxSmile: smiliness)
        smilePath.stroke()
    }
    
    
    // 模拟器中按住alt加鼠标左键 就可模拟放大缩小
    // 模拟器中按住alt+shift加鼠标左键，就可模拟双指平移
    func scale(_ gesture: UIPinchGestureRecognizer)
    {
//        if gesture.state == UIGestureRecognizerState.changed
        if gesture.state == .changed
        {
            scale *= gesture.scale
            gesture.scale = 1
        }
    }
 

}
