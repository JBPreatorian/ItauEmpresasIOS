//
//  ButtonTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 13/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

/**
 * Theme for Button
 */
public protocol ButtonTheme {
    
    var primary: ButtonStyleTheme { get }
    var secondary: ButtonStyleTheme { get }
    var ghost: OutlineButtonStyleTheme { get }
    var ghostGray: OutlineButtonStyleTheme { get }
    var link: ButtonStyleTheme { get }
    
}

public protocol ButtonStyleTheme {
    
    var normalTitleColor: UIColor { get }
    var normalBackgroundColor: UIColor { get }
    var highlightedTitleColor: UIColor { get }
    var highlightedBackgroundColor: UIColor { get }
    var disabledTitleColor: UIColor { get }
    var disabledBackgroundColor: UIColor { get }
    
}

public protocol OutlineButtonStyleTheme: ButtonStyleTheme {

    var outlineColor: UIColor { get }
    var disabledOutlineColor: UIColor { get }
    
}
