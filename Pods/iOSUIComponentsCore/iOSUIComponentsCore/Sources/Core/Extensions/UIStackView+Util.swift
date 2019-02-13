//
//  UIStackView+Util.swift
//  iOSUIComponentsCore-iOS
//
//  Created by victor.magpali on 24/01/19.
//  Copyright © 2019 inacioferrarini. All rights reserved.
//

import UIKit

extension UIStackView {

    @discardableResult
    func removeAllArrangedSubviews() -> [UIView] {
        let removedSubviews = arrangedSubviews.reduce([]) { (removedSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            NSLayoutConstraint.deactivate(subview.constraints)
            subview.removeFromSuperview()
            return removedSubviews + [subview]
        }
        return removedSubviews
    }
    
}
