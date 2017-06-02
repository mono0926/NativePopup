//
//  UIView.extension.swift
//  NativePopup
//
//  Created by mono on 2017/04/24.
//  Copyright © 2017 mono. All rights reserved.
//

import Foundation
import UIKit

extension UIView: NativePopupCompatible { }

extension NativePopupExtension where Base: UIView {
    func addSubview(_ view: UIView, insets: UIEdgeInsets = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        base.addSubview(view)
        base.leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left).isActive = true
        base.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        base.rightAnchor.constraint(equalTo: view.rightAnchor, constant: insets.right).isActive = true
        base.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).isActive = true
    }
    func addSubviewCenter(_ view: UIView, offset point: CGPoint = .zero) {
        view.translatesAutoresizingMaskIntoConstraints = false
        base.addSubview(view)
        base.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: point.x).isActive = true
        base.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: point.y).isActive = true
    }
}
