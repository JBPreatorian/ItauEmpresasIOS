//
//  AppHeaderTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 13/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

/**
 * Theme for User Initials
 */
public protocol AppHeaderTheme {
    
    var titleColor: UIColor { get }
    var subtitleColor: UIColor { get }
    var actionColor: UIColor { get }
    var userInitialsTheme: UserInitialsTheme { get }
}

/**
 * Default Values.
 */
public extension AppHeaderTheme {
    
    public var titleColor: UIColor {
        return UIColor.itauOrange
    }
    
    public var subtitleColor: UIColor {
        return UIColor.itauN60
    }
    
    public var actionColor: UIColor {
        return UIColor.itauOrange
    }
    
}
