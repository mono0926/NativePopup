//
//  AnimatableCrossView.swift
//  NativePopup
//
//  Created by mono on 2017/05/21.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

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
