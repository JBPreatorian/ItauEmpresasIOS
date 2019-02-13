//
//  UIViewController+Header.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 29/11/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */
    public var topBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.size.height +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
    }
    
}
