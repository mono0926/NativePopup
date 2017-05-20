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
        bad

        public var image: Image {
            return .image(UIImage(nativePopupNamed: "feedback_\(rawValue)"))
        }
    }

    public enum Native: ImageConvertible {
        case
        done

        public var image: Image {
            switch self {
            case .done:
                return .view(AnimatableDoneView())
            }
        }
    }
}
