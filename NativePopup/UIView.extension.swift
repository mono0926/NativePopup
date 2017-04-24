//
//  UIView.extension.swift
//  NativePopup
//
//  Created by mono on 2017/04/24.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation
import UIKit

extension UIView: ExtensionCompatible { }

extension Extension where Base: UIView {
    func addSubview(_ view: UIView, insets: UIEdgeInsets = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        base.addSubview(view)
        base.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        base.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        base.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        base.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    func addSubviewCenter(_ view: UIView, offset point: CGPoint = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        base.addSubview(view)
        base.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: point.x).isActive = true
        base.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: point.y).isActive = true
    }
}
