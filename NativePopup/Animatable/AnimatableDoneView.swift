//
//  AnimatableDoneView.swift
//  NativePopup
//
//  Created by mono on 2017/05/20.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

class AnimatableDoneView: UIView, HasAnimatablePath {
    let animatableLayer = CAShapeLayer()
    var animatablePath: UIBezierPath {
        let length = frame.width
        let path = UIBezierPath()
        path.move(to: CGPoint(x: length * 0.196, y: length * 0.527))
        path.addLine(to: CGPoint(x: length * 0.47, y: length * 0.777))
        path.addLine(to: CGPoint(x: length * 0.99, y: length * 0.25))
        return path
    }
}
