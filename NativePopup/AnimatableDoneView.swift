//
//  AnimatableDoneView.swift
//  NativePopup
//
//  Created by mono on 2017/05/20.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

class AnimatableDoneView: UIView, Animatable {
    private var drawLayer: CAShapeLayer!
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 56))
        path.addLine(to: CGPoint(x: 45, y: 88))
        path.addLine(to: CGPoint(x: 106, y: 28))

        drawLayer = CAShapeLayer()
        drawLayer.path = path.cgPath
        drawLayer.fillColor = UIColor.clear.cgColor
        drawLayer.strokeColor = tintColor.cgColor
        drawLayer.lineWidth = 9
        drawLayer.lineCap = kCALineCapRound
        drawLayer.lineJoin = kCALineCapRound
        drawLayer.strokeEnd = 0
        layer.addSublayer(drawLayer)
    }

    func animate() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.3
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        drawLayer.strokeEnd = 1
        drawLayer.add(animation, forKey: "animation")
    }
}
