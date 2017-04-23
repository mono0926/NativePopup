//
//  NativePopup.extension.swift
//  NativePopup
//
//  Created by mono on 2017/04/23.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

extension NativePopup {
    public enum Image {
        case
        good,
        bad,
        custom(image: UIImage)

        var image: UIImage {
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
}
