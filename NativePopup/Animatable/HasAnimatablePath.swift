//
//  HasAnimatableLayer.swift
//  NativePopup
//
//  Created by mono on 2017/05/20.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

public protocol HasAnimatablePath: Animatable {
    var layer: CALayer { get }
    var tintColor: UIColor! { get }
    /** Should return same instance */
    var animatableLayer: CAShapeLayer { get }
    var animatablePath: UIBezierPath { get }
}

public extension HasAnimatablePath {
    func animate() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animatableLayer.strokeEnd = 1
        animatableLayer.add(animation, forKey: "animation")
    }
    func configureAnimatableLayer() {
        animatableLayer.path = animatablePath.cgPath
        animatableLayer.fillColor = UIColor.clear.cgColor
        animatableLayer.strokeColor = tintColor?.cgColor
        animatableLayer.lineWidth = 9
        animatableLayer.lineCap = .round
        animatableLayer.lineJoin = .round
        animatableLayer.strokeEnd = 0
    }
}
