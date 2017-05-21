//
//  AnimatableCrossView.swift
//  NativePopup
//
//  Created by mono on 2017/05/21.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

class AnimatableCrossView: UIView, HasAnimatablePath {
    let animatableLayer = CAShapeLayer()
    var duration: TimeInterval { return 0.4 }
    var animatablePath: UIBezierPath {
        let length = frame.width
        let path = UIBezierPath()
        path.move(to: CGPoint(x: length * 0.1, y: length * 0.1))
        path.addLine(to: CGPoint(x: length * 0.9, y: length * 0.9))
        path.move(to: CGPoint(x: length * 0.9, y: length * 0.1))
        path.addLine(to: CGPoint(x: length * 0.1, y: length * 0.9))
        return path
    }
}
