//
//  UIButton+Ext.swift
//  Shopper
//
//  Created by Fulden Onan on 7.11.2022.
//

import UIKit

extension UIButton {
    func cornerButton() {
        layer.cornerRadius = 5
        clipsToBounds = true
    }
}
