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
    var image: Image { get }
}

extension UIImage: ImageConvertible {
    public var image: Image { return .image(self) }
}

extension Character: ImageConvertible {
    public var image: Image { return .emoji(self) }
}
