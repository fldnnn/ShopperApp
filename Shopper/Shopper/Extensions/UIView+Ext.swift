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
    
    func giveElevation() {
        let shadowSize : CGFloat = 0.5
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: self.frame.size.width,
                                                   height: self.frame.size.height + shadowSize))
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor(named: "mainLightColor")?.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowOpacity = 0.1
        self.layer.shadowPath = shadowPath.cgPath
        }
}
