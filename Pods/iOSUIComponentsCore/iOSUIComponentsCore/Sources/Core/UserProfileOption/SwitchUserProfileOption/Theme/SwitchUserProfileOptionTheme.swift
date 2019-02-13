//
//  SwitchUserProfileOptionTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 14/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

/**
 * Theme for Switch User Profile Option
 */
public protocol SwitchUserProfileOptionTheme: UserProfileOptionTheme {
    
    var `switch`: SwitchTheme { get }
    
}

public extension SwitchUserProfileOptionTheme {
    
    public var backgroundColor: UIColor {
        return UIColor.itauN0
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
}
