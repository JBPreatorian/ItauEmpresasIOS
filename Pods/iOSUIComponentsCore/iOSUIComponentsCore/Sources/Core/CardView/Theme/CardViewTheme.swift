//
//  CardViewTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by inacio.ferrarini on 11/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

/**
 * Theme for Card View
 */
public protocol CardViewTheme {
    
    var backgroundColor: UIColor { get }
    var titleColor: UIColor { get }
    var textColor: UIColor { get }
    var actionColor: UIColor { get }
    
}

/**
 * Default Values.
 */
public extension CardViewTheme {
    
    public var backgroundColor: UIColor {
        return UIColor.itauN0
    }

    public var titleColor: UIColor {
        return UIColor.itauOrange
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
    public var actionColor: UIColor {
        return UIColor.itauBlue
    }
    
}
