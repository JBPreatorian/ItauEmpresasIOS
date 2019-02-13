//
//  UserInitialsTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 12/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

/**
 * Theme for User Initials
 */
public protocol UserInitialsTheme {
    
    var backgroundColor: UIColor { get }
    var iconTextColor: UIColor { get }
    var textColor: UIColor { get }
    
}

/**
 * Default Values.
 */
public extension UserInitialsTheme {
    
    public var backgroundColor: UIColor {
        return UIColor.itauN30
    }

    public var iconTextColor: UIColor {
        return UIColor.itauN40
    }

}
