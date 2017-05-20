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

        let path = UIBezierPath()
        path.move(to: CGPoint(x: 22, y: 59))
        path.addLine(to: CGPoint(x: 53, y: 87))
        path.addLine(to: CGPoint(x: 111, y: 28))

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
