//
//  HasAnimatableLayer.swift
//  NativePopup
//
//  Created by mono on 2017/05/20.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

protocol HasAnimatableLayer: Animatable {
    var animatableLayer: CAShapeLayer { get }
}

extension HasAnimatableLayer {
    func animate() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 0.3
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animatableLayer.strokeEnd = 1
        animatableLayer.add(animation, forKey: "animation")
    }
}
