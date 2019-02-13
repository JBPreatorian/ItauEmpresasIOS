//
//  ButtonStyleTheme+Varejo.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 21/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

struct DefaultPrimaryButtonStyleTheme: ButtonStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var normalTitleColor: UIColor {
        return UIColor.itauN0
    }
    
    public var normalBackgroundColor: UIColor {
        return UIColor.itauOrange
    }
    
    public var highlightedTitleColor: UIColor {
        return normalTitleColor
    }
    
    public var highlightedBackgroundColor: UIColor {
        return UIColor.itauTouchOrange
    }
    
    public var disabledTitleColor: UIColor {
        return UIColor.itauN50
    }
    
    public var disabledBackgroundColor: UIColor {
        return UIColor.itauN40
    }
    
}

struct DefaultSecondaryButtonStyleTheme: ButtonStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var normalTitleColor: UIColor {
        return UIColor.itauBlue
    }
    
    public var normalBackgroundColor: UIColor {
        return UIColor.itauN0
    }
    
    public var highlightedTitleColor: UIColor {
        return normalTitleColor
    }
    
    public var highlightedBackgroundColor: UIColor {
        return UIColor.itauN10
    }
    
    public var disabledTitleColor: UIColor {
        return UIColor.itauN50
    }
    
    public var disabledBackgroundColor: UIColor {
        return UIColor.itauN40
    }
    
}

struct DefaultGhostButtonStyleTheme: OutlineButtonStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var normalTitleColor: UIColor {
        return UIColor.itauOrange
    }
    
    public var normalBackgroundColor: UIColor {
        return UIColor.itauN10
    }
    
    public var highlightedTitleColor: UIColor {
        return normalTitleColor
    }
    
    public var highlightedBackgroundColor: UIColor {
        return UIColor.itauN20
    }
    
    public var disabledTitleColor: UIColor {
        return UIColor.itauN50
    }

    public var disabledBackgroundColor: UIColor {
        return UIColor.itauN20
    }
    
    public var outlineColor: UIColor {
        return UIColor.itauOrange
    }

    public var disabledOutlineColor: UIColor {
        return UIColor.itauN50
    }

}

struct DefaultGhostGrayButtonStyleTheme: OutlineButtonStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var normalTitleColor: UIColor {
        return UIColor.itauN70
    }
    
    public var normalBackgroundColor: UIColor {
        return UIColor.itauN10
    }
    
    public var highlightedTitleColor: UIColor {
        return normalTitleColor
    }
    
    public var highlightedBackgroundColor: UIColor {
        return UIColor.itauN20
    }
    
    public var disabledTitleColor: UIColor {
        return UIColor.itauN50
    }
    
    public var disabledBackgroundColor: UIColor {
        return UIColor.itauN20
    }
    
    public var outlineColor: UIColor {
        return UIColor.itauN70
    }

    public var disabledOutlineColor: UIColor {
        return UIColor.itauN50
    }
    
}

struct DefaultLinkButtonStyleTheme: ButtonStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var normalTitleColor: UIColor {
        return UIColor.itauBlue
    }
    
    public var normalBackgroundColor: UIColor {
        return UIColor.clear
    }
    
    public var highlightedTitleColor: UIColor {
        return normalTitleColor
    }
    
    public var highlightedBackgroundColor: UIColor {
        return normalBackgroundColor
    }
    
    public var disabledTitleColor: UIColor {
        return normalTitleColor
    }
    
    public var disabledBackgroundColor: UIColor {
        return normalBackgroundColor
    }
    
}
