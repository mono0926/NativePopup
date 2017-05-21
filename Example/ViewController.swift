//
//  ViewController.swift
//  Example
//
//  Created by mono on 2017/04/23.
//  Copyright © 2017 mono. All rights reserved.
//

import UIKit
import NativePopup

class ViewController: UIViewController {

    override var prefersStatusBarHidden: Bool { return true }

    @IBAction func customDidTap(_ sender: UIButton) {
        NativePopup.show(image: UIImage(named: "love")!,
                         title: "参考になった",
                         message: "フィードバックをありがとう\nございました。")
    }
    @IBAction func goodDidTap(_ sender: UIButton) {
        NativePopup.show(image: Preset.Feedback.good,
                         title: "Helpful",
                         message: "Thanks for your feedback.")
    }
    @IBAction func badDidTap(_ sender: UIButton) {
        NativePopup.show(image: Preset.Feedback.bad,
                         title: "Not Helpful",
                         message: "Thanks for your feedback.")
    }
    @IBAction func emptyMessageDidTap(_ sender: UIButton) {
        NativePopup.show(image: Preset.Feedback.good,
                         title: "Empty Message 🗑",
                         message: nil)
    }
    @IBAction func emojiDidTap(_ sender: UIButton) {
        NativePopup.show(image: Character("🐶"),
                         title: "イッヌ",
                         message: "絵文字対応したワン")
    }
    @IBAction func longDidTap(_ sender: UIButton) {
        NativePopup.show(image: Character("🔟"),
                         title: "10 seconds",
                         message: "Long duration🙇",
                         duration: 10)
    }
    @IBAction func fadeInDidTap(_ sender: UIButton) {
        NativePopup.show(image: Preset.Feedback.good,
                         title: "Helpful",
                         message: "Thanks for your feedback.",
                         initialEffectType: .fadeIn)
    }
    @IBAction func doneAnimatinDidTap(_ sender: UIButton) {
        NativePopup.show(image: Preset.Feedback.done,
                         title: "Added to Library",
                         message: nil,
                         initialEffectType: .fadeIn)
    }
    @IBAction func crossAnimatinDidTap(_ sender: UIButton) {
        NativePopup.show(image: Preset.Feedback.cross,
                         title: "Blocked!",
                         message: nil,
                         initialEffectType: .fadeIn)
    }
}

class AnimatableDoneView2: UIView, HasAnimatablePath {
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

