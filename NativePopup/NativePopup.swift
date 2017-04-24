//
//  NativePopup.swift
//  NativePopup
//
//  Created by mono on 2017/04/23.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation
import UIKit

public class NativePopup: UIView {
    private static let keyWindow = UIApplication.shared.keyWindow!
    fileprivate weak static var currentView: NativePopup?

    public static func show(image: ImageConvertible, title: String, message: String?) {
        let view = NativePopup(image: image, title: title, message: message)
        view.show()
    }

    public required init(coder aDecoder: NSCoder) {
        fatalError("should not be called")
    }

    private init(image: ImageConvertible, title: String, message: String?) {
        super.init(frame: CGRect.zero)

        layer.cornerRadius = 8
        clipsToBounds = true

        isUserInteractionEnabled = false

        let image = image.image
        image.validate()
        let imageView: UIView
        switch image {
        case .image(let image):
            imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = 6
            imageView.clipsToBounds = true
        case .emoji(let character):
            let label = UILabel()
            label.text = String(character)
            label.font = UIFont.systemFont(ofSize: 100)
            label.clipsToBounds = false
            label.textAlignment = .center
            label.lineBreakMode = .byCharWrapping
            imageView = label
            break
        }

        let titleLabel = UILabel()
        titleLabel.text = title
        // not dynamic size
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)

        let messageLabel = UILabel()
        messageLabel.text = message
        messageLabel.font = UIFont.systemFont(ofSize: 15)

        [titleLabel, messageLabel].forEach {
            $0.textColor = UIColor(white: 0.35, alpha: 1)
            $0.numberOfLines = 0
            let style = NSMutableParagraphStyle()
            style.lineSpacing = 3
            style.alignment = .center
            $0.attributedText = NSAttributedString(string: $0.text ?? "", attributes: [NSParagraphStyleAttributeName: style])
        }

        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        addSubview(effectView)
        effectView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        effectView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        effectView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        effectView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        addSubview(imageView)
        addSubview(titleLabel)

        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 112).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor, constant: 32).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -21).isActive = true

        let sideSpace: CGFloat = 8
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: sideSpace).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -sideSpace).isActive = true

        let bottomSpace: CGFloat = 28
        if message?.isEmpty ?? true {
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomSpace).isActive = true
        } else {
            addSubview(messageLabel)
            titleLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -10).isActive = true
            messageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: sideSpace).isActive = true
            messageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -sideSpace).isActive = true
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomSpace).isActive = true
        }

        [self, effectView, imageView, titleLabel, messageLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    private func show() {
        let window = type(of: self).keyWindow
        // TODO: need to remove?
        type(of: self).currentView?.removeFromSuperview()
        type(of: self).currentView = self
        window.addSubview(self)
        widthAnchor.constraint(equalToConstant: 250).isActive = true
        centerXAnchor.constraint(equalTo: window.centerXAnchor).isActive = true

        let defaultY = centerYAnchor.constraint(equalTo: window.centerYAnchor)
        let initialY = topAnchor.constraint(equalTo: window.bottomAnchor)
        initialY.isActive = true
        window.layoutIfNeeded()

        initialY.isActive = false
        defaultY.isActive = true
        // TODO: adjust animation
        // TODO: refactor(resolve nest)
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: {
                        window.layoutIfNeeded()
        }, completion: { finished in
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
                // TODO: adjust duration(consider text length?)
                // TODO: adjust animation
                UIView.animate(withDuration: 0.2,
                               animations: {
                                // for visual effecto view smooth animation
                                self.subviews.forEach { $0.alpha = 0 }
                                self.transform = self.transform.scaledBy(x: 0.8, y: 0.8)
                },
                               completion: { finished in
                                self.removeFromSuperview()
                })
            }
        })
    }
}
