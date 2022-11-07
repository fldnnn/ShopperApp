//
//  UIView+Ext.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import Foundation
import UIKit

extension UIView {
    func addShadow() {
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.borderColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.2
        layer.masksToBounds = true
    }
}
