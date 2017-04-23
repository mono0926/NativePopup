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
    private weak static var currentView: NativePopup?

    public enum Image {
        case
        good,
        bad,
        custom(image: UIImage)

        fileprivate var image: UIImage {
            switch self {
            case .good: return type(of: self).createImage(named: "good")
            case .bad: return type(of: self).createImage(named: "bad")
            case .custom(let image): return image
            }
        }

        private static func createImage(named: String) -> UIImage {
            return UIImage.init(named: named, in: Bundle(for: NativePopup.self), compatibleWith: nil)!
        }
    }

    public struct Info {
        public let image: Image
        public let title: String
        public let message: String?
        public init(image: Image, title: String, message: String?) {
            self.image = image
            self.title = title
            self.message = message
        }
    }

    public static func show(info: Info) {
        let view = NativePopup(info: info)
        view.show()
        currentView = view
    }

    public required init(coder aDecoder: NSCoder) {
        fatalError("should not be called")
    }

    private init(info: Info) {
        super.init(frame: CGRect.zero)

        layer.cornerRadius = 8
        clipsToBounds = true

        isUserInteractionEnabled = false

        let image = info.image.image
        let imageView = UIImageView(image: image)
        assert(image.size.width == image.size.height, "Aspect ratio should be 1:1.")
        imageView.contentMode = .scaleAspectFit
        if case .custom = info.image {
            imageView.layer.cornerRadius = 6
            imageView.clipsToBounds = true
        }

        let titleLabel = UILabel()
        titleLabel.text = info.title
        // not dynamic size
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)

        let messageLabel = UILabel()
        messageLabel.text = info.message
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
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: sideSpace).isActive = true

        let bottomSpace: CGFloat = 28
        if info.message?.isEmpty ?? true {
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomSpace).isActive = true
        } else {
            addSubview(messageLabel)
            titleLabel.bottomAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -10).isActive = true
            messageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: sideSpace).isActive = true
            messageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: sideSpace).isActive = true
            messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -bottomSpace).isActive = true
        }

        [self, effectView, imageView, titleLabel, messageLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }

    private func show() {
        let window = type(of: self).keyWindow
        // 消すか迷う
        for v in window.subviews where v is NativePopup { v.removeFromSuperview() }
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
                                self.alpha = 0
                                self.transform = self.transform.scaledBy(x: 0.8, y: 0.8)
                },
                               completion: { finished in
                                self.removeFromSuperview()
                })
            }
        })
    }
}
