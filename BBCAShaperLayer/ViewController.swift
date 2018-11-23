//
//  ViewController.swift
//  BBCAShaperLayer
//
//  Created by 120v on 2018/11/23.
//  Copyright © 2018 MQ. All rights reserved.
//

import UIKit

let LeverGap: CGFloat = 160

class ViewController: UIViewController {
    
    let stepV = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.groupTableViewBackground.withAlphaComponent(1)
        
        self.drawFullLine()
        
        self.drawDottLine()
        
        self.addStation()
        
        self.addStep()
    }
    
    @IBAction func goAction(_ sender: Any) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.toValue = CGPoint(x: self.view.frame.width - 60, y: LeverGap + 100)
        animation.duration = 5
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
//        animation.beginTime = CACurrentMediaTime() + 5
        self.stepV.layer.add(animation, forKey: nil)
    }
    
    
    //MARK: - 画实线
    func drawFullLine() {
       
        let linPath = UIBezierPath()
        linPath.move(to: CGPoint(x: 60, y: 100))
        for i in 1..<7 {
            var linPathX: CGFloat = 0
            if i%2 == 0 {
                linPathX = 60
            }else{
                linPathX = self.view.frame.width - 60
            }
            linPath.addLine(to: CGPoint(x: linPathX, y: 100 + LeverGap*CGFloat(i)))
        }
        linPath.lineCapStyle = CGLineCap.round
        linPath.lineJoinStyle = .bevel
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = linPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.orange.withAlphaComponent(0.8).cgColor
        shapeLayer.lineWidth = 40
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineCap = CAShapeLayerLineCap.butt
        
        CATransaction.begin()
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 3.0
        pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        shapeLayer.add(pathAnimation, forKey: "strokeEndAnimation")
        shapeLayer.strokeEnd = 1.0
        self.view.layer.addSublayer(shapeLayer)
        CATransaction.commit()
        
    }
    
    //MARK: - 画虚线
    func drawDottLine() {
        
        let linPath = UIBezierPath()
        linPath.move(to: CGPoint(x: 60, y: 100))
        for i in 1..<7 {
            var linPathX: CGFloat = 0
            if i%2 == 0 {
                linPathX = 60
            }else{
                linPathX = self.view.frame.width - 60
            }
            linPath.addLine(to: CGPoint(x: linPathX, y: 100 + LeverGap*CGFloat(i)))
        }
        linPath.lineCapStyle = CGLineCap.butt
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = linPath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.white.withAlphaComponent(0.8).cgColor
        shapeLayer.lineWidth = 1
        //        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        //        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer.lineDashPattern = Array(arrayLiteral: NSNumber(integerLiteral: 30),NSNumber(integerLiteral: 10))
        
        CATransaction.begin()
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 3.0
        pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pathAnimation.fromValue = 0.0
        pathAnimation.toValue = 1.0
        shapeLayer.add(pathAnimation, forKey: "strokeEndAnimation")
        shapeLayer.strokeEnd = 1.0
        self.view.layer.addSublayer(shapeLayer)
        CATransaction.commit()
    }
    
    //MARK: - 添加等级站点
    func addStation() {
        
        for i in 0..<7 {
            let imgV = UIImageView()
            imgV.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            var imgVX: CGFloat = 0
            if i%2 == 0 {
                imgVX = 60
            }else{
                imgVX = self.view.frame.width - 60
            }
            imgV.center = CGPoint(x: imgVX, y: 100 + LeverGap * CGFloat(i))
            imgV.backgroundColor = UIColor.purple
            self.view.addSubview(imgV)
        }
    }
    
    //MARK: - 添加移动点
    func addStep() {
        stepV.frame = CGRect(x: 0, y: 0, width: 20, height: 50)
        stepV.center = CGPoint(x: 60, y: 100)
        stepV.backgroundColor = UIColor.green
        self.view.addSubview(stepV)
    }
}

