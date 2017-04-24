//
//  Extension.swift
//  NativePopup
//
//  Created by mono on 2017/04/24.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation

struct Extension<Base> {
    let base: Base
    init (_ base: Base) {
        self.base = base
    }
}

protocol ExtensionCompatible {
    associatedtype Compatible
    static var np: Extension<Compatible>.Type { get }
    var np: Extension<Compatible> { get }
}

extension ExtensionCompatible {
    static var np: Extension<Self>.Type {
        return Extension<Self>.self
    }

    var np: Extension<Self> {
        return Extension(self)
    }
}
