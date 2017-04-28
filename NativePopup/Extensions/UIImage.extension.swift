//
//  UIImage.extension.swift
//  NativePopup
//
//  Created by mono on 2017/04/24.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    convenience init(nativePopupNamed name: String) {
        self.init(named: name, in: .nativePopup, compatibleWith: nil)!
    }
}

