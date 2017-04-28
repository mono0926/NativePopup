//
//  NativePopup.extension.swift
//  NativePopup
//
//  Created by mono on 2017/04/23.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

extension NativePopup {
    public struct Preset {
        private init() {}
        public enum Feedback: String, ImageConvertible {
            case
            good,
            bad

            public var image: Image {
                return .image(UIImage.init(nativePopupNamed: "feedback_\(rawValue)"))
            }
        }
    }
}
