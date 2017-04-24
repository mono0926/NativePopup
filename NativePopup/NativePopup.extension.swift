//
//  NativePopup.extension.swift
//  NativePopup
//
//  Created by mono on 2017/04/23.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

extension NativePopup {
    public struct Image {
        private init() {}
        public enum Feedback: String, UIImageConvertible {
            case
            good,
            bad

            public var image: UIImage {
                return UIImage(
                    named: "feedback_\(rawValue)",
                    in: .nativePopup,
                    compatibleWith: nil)!
            }
        }
    }
}
