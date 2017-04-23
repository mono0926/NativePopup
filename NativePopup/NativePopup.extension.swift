//
//  NativePopup.extension.swift
//  NativePopup
//
//  Created by mono on 2017/04/23.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

extension NativePopup {
    public enum FeedbackImage: String, HavingUIImageName {
        case
        good,
        bad
        
        public var imageName: String { return "feedback_\(rawValue)" }
    }
}
