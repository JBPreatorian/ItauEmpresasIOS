//
//  PageHeaderTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 13/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

/**
 * Theme for User Initials
 */
public protocol PageHeaderTheme {
    
    var titleColor: UIColor { get }
    var subtitleColor: UIColor { get }
    var actionColor: UIColor { get }
    
}

/**
 * Default Values.
 */
public extension PageHeaderTheme {

    public var titleColor: UIColor {
        return UIColor.itauN80
    }
    
    public var subtitleColor: UIColor {
        return UIColor.itauN60
    }
    
    public var actionColor: UIColor {
        return UIColor.itauOrange
    }
    
}
