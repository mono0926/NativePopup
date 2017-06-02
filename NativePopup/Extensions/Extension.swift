//
//  Extension.swift
//  NativePopup
//
//  Created by mono on 2017/04/24.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

struct NativePopupExtension<Base> {
    let base: Base
    init (_ base: Base) {
        self.base = base
    }
}

protocol NativePopupCompatible {
    associatedtype Compatible
    static var np: NativePopupExtension<Compatible>.Type { get }
    var np: NativePopupExtension<Compatible> { get }
}

extension NativePopupCompatible {
    static var np: NativePopupExtension<Self>.Type {
        return NativePopupExtension<Self>.self
    }

    var np: NativePopupExtension<Self> {
        return NativePopupExtension(self)
    }
}
