//
//  ButtonUserProfileOptionTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 14/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

/**
 * Theme for Button User Profile Option
 */
public protocol ButtonUserProfileOptionTheme: UserProfileOptionTheme {
    
    var actionColor: UIColor { get }
    
}

public extension ButtonUserProfileOptionTheme {
    
    public var backgroundColor: UIColor {
        return UIColor.itauN0
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
}
