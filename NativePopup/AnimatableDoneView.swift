//
//  AnimatableDoneView.swift
//  NativePopup
//
//  Created by mono on 2017/05/20.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

class AnimatableDoneView: UIView, HasAnimatableLayer {

    let animatableLayer = CAShapeLayer()
    override func layoutSubviews() {
        super.layoutSubviews()

        let length = frame.width
        let path = UIBezierPath()
        path.move(to: CGPoint(x: length * 0.196, y: length * 0.527))
        path.addLine(to: CGPoint(x: length * 0.47, y: length * 0.777))
        path.addLine(to: CGPoint(x: length * 0.99, y: length * 0.25))

        animatableLayer.path = path.cgPath
        animatableLayer.fillColor = UIColor.clear.cgColor
        animatableLayer.strokeColor = tintColor.cgColor
        animatableLayer.lineWidth = 9
        animatableLayer.lineCap = kCALineCapRound
        animatableLayer.lineJoin = kCALineCapRound
        animatableLayer.strokeEnd = 0
        layer.addSublayer(animatableLayer)
    }
}

class AnimatableCrossView: UIView, HasAnimatableLayer {

    let animatableLayer = CAShapeLayer()

    var duration: TimeInterval { return 0.4 }

    override func layoutSubviews() {
        super.layoutSubviews()

        let length = frame.width
        let path = UIBezierPath()
        path.move(to: CGPoint(x: length * 0.1, y: length * 0.1))
        path.addLine(to: CGPoint(x: length * 0.9, y: length * 0.9))
        path.move(to: CGPoint(x: length * 0.1, y: length * 0.9))
        path.addLine(to: CGPoint(x: length * 0.9, y: length * 0.1))

        animatableLayer.path = path.cgPath
        animatableLayer.fillColor = UIColor.clear.cgColor
        animatableLayer.strokeColor = tintColor.cgColor
        animatableLayer.lineWidth = 9
        animatableLayer.lineCap = kCALineCapRound
        animatableLayer.lineJoin = kCALineCapRound
        animatableLayer.strokeEnd = 0
        layer.addSublayer(animatableLayer)
    }
}
