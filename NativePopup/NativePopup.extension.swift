//
//  NativePopup.extension.swift
//  NativePopup
//
//  Created by mono on 2017/04/23.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

private func createUIImage(named name: String) -> UIImage {
    return UIImage(named: name, in: Bundle(for: NativePopup.self), compatibleWith: nil)!
}

extension NativePopup {
    public struct Image {
        private init() {}
        public enum Feedback: String, UIImageConvertible {
            case
            good,
            bad

            public var image: UIImage { return createUIImage(named: "feedback_\(rawValue)") }
        }
    }
}
