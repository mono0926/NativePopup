//
//  UIImageConvertible.swift
//  NativePopup
//
//  Created by mono on 2017/04/23.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation
import UIKit

public protocol UIImageConvertible {
    var image: UIImage { get }
}

extension UIImage: UIImageConvertible {
    public var image: UIImage { return self }
}

public protocol HavingUIImageName: UIImageConvertible {
    var imageName: String { get }
}

extension HavingUIImageName {
    public var image: UIImage { return UIImage.init(named: imageName, in: Bundle(for: NativePopup.self), compatibleWith: nil)! }
}
