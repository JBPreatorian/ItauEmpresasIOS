//
//  TabBarTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 12/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public protocol TabBarTheme {
    
    var background: UIColor { get }
    var textColor: UIColor { get }
    var iconColor: UIColor { get }
    var selectedIconBackgroundColor: UIColor { get }
    var selectedIconColor: UIColor { get }
    
}

/**
 * Default Values.
 */
public extension TabBarTheme {
    
    public var selectedIconBackgroundColor: UIColor {
        return UIColor.itauN0
    }
    
}
