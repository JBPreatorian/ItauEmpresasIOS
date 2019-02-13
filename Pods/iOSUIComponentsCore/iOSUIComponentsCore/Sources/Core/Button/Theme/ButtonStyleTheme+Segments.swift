//
//  ButtonStyleTheme+Segments.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 13/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit


// MARK: - Personnalite

struct PersonnalitePrimaryButtonStyleTheme: ButtonStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var normalTitleColor: UIColor {
        return UIColor.itauN80
    }
    
    public var normalBackgroundColor: UIColor {
        return UIColor.itauPersonnaliteGold
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

struct PersonnaliteGhostButtonStyleTheme: OutlineButtonStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var normalTitleColor: UIColor {
        return UIColor.itauChocolate
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
        return UIColor.itauChocolate
    }
    
    public var disabledOutlineColor: UIColor {
        return UIColor.itauN50
    }
    
}


// MARK: - Personal Bank

struct PersonalBankPrimaryButtonStyleTheme: ButtonStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var normalTitleColor: UIColor {
        return UIColor.itauN70
    }
    
    public var normalBackgroundColor: UIColor {
        return UIColor.itauPersonalBankGold
    }
    
    public var highlightedTitleColor: UIColor {
        return normalTitleColor
    }
    
    public var highlightedBackgroundColor: UIColor {
        return UIColor.itauTouchPersonalBank
    }
    
    public var disabledTitleColor: UIColor {
        return UIColor.itauN50
    }
    
    public var disabledBackgroundColor: UIColor {
        return UIColor.itauN40
    }
    
}

struct PersonalBankGhostButtonStyleTheme: OutlineButtonStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var normalTitleColor: UIColor {
        return UIColor.itauPersonalBankCopper
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
        return UIColor.itauPersonalBankCopper
    }
    
    public var disabledOutlineColor: UIColor {
        return UIColor.itauN50
    }
    
}
