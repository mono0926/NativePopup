//
//  NativePopup.extension.swift
//  NativePopup
//
//  Created by mono on 2017/04/23.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

public struct Preset {
    private init() {}
    public enum Feedback: String, ImageConvertible {
        case
        good,
        bad,
        done

        public var additionalMarginTop: CGFloat {
            switch self {
            case .good, .bad: return 0
            case .done: return 31
            }
        }
        public var additionalMarginBottom: CGFloat {
            switch self {
            case .good, .bad: return 0
            case .done: return 18
            }
        }

        public var image: Image {
            switch self {
            case .good, .bad:
                return .image(UIImage(nativePopupNamed: "feedback_\(rawValue)"))
            case .done:
                return .view(AnimatableDoneView())
            }
        }
    }
}
