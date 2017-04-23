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

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(image: UIImage(named: "home"))
        imageView.contentMode = .scaleToFill
        view.insertSubview(imageView, at: 0)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    @IBAction func customDidTap(_ sender: UIButton) {
        NativePopup.show(image: UIImage(named: "love")!,
                         title: "参考になった",
                         message: "フィードバックをありがとう\nございました。")
    }
    @IBAction func goodDidTap(_ sender: UIButton) {
        NativePopup.show(image: NativePopup.FeedbackImage.good,
                         title: "Helpful",
                         message: "Thanks for your feedback.")
    }
    @IBAction func badDidTap(_ sender: UIButton) {
        NativePopup.show(image: NativePopup.FeedbackImage.bad,
                         title: "Not Helpful",
                         message: "Thanks for your feedback.")
    }
}

