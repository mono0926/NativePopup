//
//  UIImageConvertible.swift
//  NativePopup
//
//  Created by mono on 2017/04/23.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation
import UIKit

public enum Image {
    case image(UIImage)
    case emoji(Character)
    case view(UIView)

    func validate() {
        switch self {
        case .image(let image):
            assert(image.size.width == image.size.height, "Aspect ratio should be 1:1.")
        case .emoji, .view:
            // MEMO: should check?
            break
        }
    }
}

public protocol ImageConvertible {
    var npImage: Image { get }
    var additionalMarginTop: CGFloat { get }
    var additionalMarginBottom: CGFloat { get }
}

extension ImageConvertible {
    public var additionalMarginTop: CGFloat { return 0 }
    public var additionalMarginBottom: CGFloat { return 0 }
}

extension UIImage: ImageConvertible {
    public var npImage: Image { return .image(self) }
}

extension Character: ImageConvertible {
    public var npImage: Image { return .emoji(self) }
}

extension UIView: ImageConvertible {
    public var npImage: Image { return .view(self) }
}
