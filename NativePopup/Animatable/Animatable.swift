//
//  Animatable.swift
//  NativePopup
//
//  Created by mono on 2017/05/20.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

public protocol Animatable {
    func animate()
}

public extension Animatable {
    var duration: TimeInterval { return 0.3 }
}
