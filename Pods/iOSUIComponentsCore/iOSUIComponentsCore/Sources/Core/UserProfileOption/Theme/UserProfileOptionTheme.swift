//
//  UserProfileOptionTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 14/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

/**
 * Theme for User Profile Option
 */
public protocol UserProfileOptionTheme {

    var backgroundColor: UIColor { get }
    var iconColor: UIColor { get }
    var textColor: UIColor { get }

}

public extension UserProfileOptionTheme {

    public var backgroundColor: UIColor {
        return UIColor.itauN0
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
}
