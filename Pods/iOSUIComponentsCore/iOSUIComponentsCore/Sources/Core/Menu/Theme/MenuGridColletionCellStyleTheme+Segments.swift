//
//  MenuGridCollectionCellTheme+Segments.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 14/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit


// MARK: - Common

public struct CommonBlueMenuGridColletionCellStyleTheme: MenuGridColletionCellStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var iconColor: UIColor {
        return UIColor.itauN0
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
    public var backgroundColor: UIColor {
        return UIColor.itauBlue
    }
    
    public var selectedBackgroundColor: UIColor {
        return UIColor.itauBlue.darker(by: 10) ?? UIColor.itauBlue
    }
    
    public var badgeTextColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeBackgroundColor: UIColor {
        return UIColor.itauBlue
    }
    
}


// MARK: - Varejo

public struct VarejoThemeMenuGridColletionCellStyleTheme: MenuGridColletionCellStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var iconColor: UIColor {
        return UIColor.itauOrange
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
    public var backgroundColor: UIColor {
        return .itauN0
    }
    
    public var selectedBackgroundColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeTextColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeBackgroundColor: UIColor {
        return UIColor.itauBlue
    }

}


// MARK: - Uniclass

public struct UniclassThemeMenuGridColletionCellStyleTheme: MenuGridColletionCellStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var iconColor: UIColor {
        return UIColor.itauUniclassGray
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
    public var backgroundColor: UIColor {
        return .itauN0
    }
    
    public var selectedBackgroundColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeTextColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeBackgroundColor: UIColor {
        return UIColor.itauBlue
    }
    
}


// MARK: - Personnalite

public struct PersonnaliteThemeMenuGridColletionCellStyleTheme: MenuGridColletionCellStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var iconColor: UIColor {
        return UIColor.itauPersonnaliteGold
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
    public var backgroundColor: UIColor {
        return .itauN0
    }
    
    public var selectedBackgroundColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeTextColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeBackgroundColor: UIColor {
        return UIColor.itauBlue
    }
    
}


// MARK: - Personal Bank

public struct PersonalBankThemeMenuGridColletionCellStyleTheme: MenuGridColletionCellStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var iconColor: UIColor {
        return UIColor.itauPersonalBankCopper
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
    public var backgroundColor: UIColor {
        return .itauN0
    }
    
    public var selectedBackgroundColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeTextColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeBackgroundColor: UIColor {
        return UIColor.itauBlue
    }
    
}


// MARK: - Private

public struct PrivateThemeMenuGridColletionCellStyleTheme: MenuGridColletionCellStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var iconColor: UIColor {
        return UIColor.itauPrivateGray
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
    public var backgroundColor: UIColor {
        return .itauN0
    }
    
    public var selectedBackgroundColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeTextColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeBackgroundColor: UIColor {
        return UIColor.itauBlue
    }
    
}


// MARK: - Empresas

public struct EmpresasThemeMenuGridColletionCellStyleTheme: MenuGridColletionCellStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var iconColor: UIColor {
        return UIColor.itauEmpresasBlue
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
    public var backgroundColor: UIColor {
        return .itauN0
    }
    
    public var selectedBackgroundColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeTextColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeBackgroundColor: UIColor {
        return UIColor.itauBlue
    }
    
}


// MARK: - Itaucard

public struct ItaucardThemeMenuGridColletionCellStyleTheme: MenuGridColletionCellStyleTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var iconColor: UIColor {
        return UIColor.itauOrange
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
    public var backgroundColor: UIColor {
        return .itauN0
    }
    
    public var selectedBackgroundColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeTextColor: UIColor {
        return UIColor.itauN10
    }
    
    public var badgeBackgroundColor: UIColor {
        return UIColor.itauBlue
    }
    
}
