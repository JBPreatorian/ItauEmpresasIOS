//
//  TabBarTheme+Segments.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 12/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

/**
 * Theme for 'Varejo' branch.
 */
public struct VarejoTabBarTheme: TabBarTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var background: UIColor {
        return UIColor.itauOrange
    }
    
    public var textColor: UIColor {
        return UIColor.itauN0
    }
    
    public var iconColor: UIColor {
        return UIColor.itauN0
    }
    
    public var selectedIconColor: UIColor {
        return UIColor.itauOrange
    }
    
}

/**
 * Theme for 'Uniclass' branch.
 */
public struct UniclassTabBarTheme: TabBarTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var background: UIColor {
        return UIColor.itauUniclassGray
    }
    
    public var textColor: UIColor {
        return UIColor.itauN0
    }
    
    public var iconColor: UIColor {
        return UIColor.itauN0
    }
    
    public var selectedIconColor: UIColor {
        return UIColor.itauN80
    }
    
}

/**
 * Theme for 'Personnalité' branch.
 */
public struct PersonnaliteTabBarTheme: TabBarTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var background: UIColor {
        return UIColor.itauPersonnaliteGold
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
    public var iconColor: UIColor {
        return UIColor.itauN80
    }
    
    public var selectedIconColor: UIColor {
        return UIColor.itauChocolate
    }
    
}

/**
 * Theme for 'Personal Bank' branch.
 */
public struct PersonalBankTabBarTheme: TabBarTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var background: UIColor {
        return UIColor.itauPersonalBankGold
    }
    
    public var textColor: UIColor {
        return UIColor.itauN70
    }
    
    public var iconColor: UIColor {
        return UIColor.itauN70
    }
    
    public var selectedIconColor: UIColor {
        return UIColor.itauDarkGold
    }
    
}

/**
 * Theme for 'Private' branch.
 */
public struct PrivateTabBarTheme: TabBarTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var background: UIColor {
        return UIColor.itauPrivateGray
    }
    
    public var textColor: UIColor {
        return UIColor.itauN0
    }
    
    public var iconColor: UIColor {
        return UIColor.itauN0
    }
    
    public var selectedIconColor: UIColor {
        return UIColor.itauN80
    }
    
}

/**
 * Theme for 'Empresas' branch.
 */
public struct EmpresasTabBarTheme: TabBarTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var background: UIColor {
        return UIColor.itauEmpresasBlue
    }
    
    public var textColor: UIColor {
        return UIColor.itauN0
    }
    
    public var iconColor: UIColor {
        return UIColor.itauN0
    }
        
    public var selectedIconColor: UIColor {
        return UIColor.itauEmpresasBlue
    }
    
}

/**
 * Theme for 'Itaucard' branch.
 */
public struct ItaucardTabBarTheme: TabBarTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var background: UIColor {
        return UIColor.itauN10
    }
    
    public var textColor: UIColor {
        return UIColor.itauN80
    }
    
    public var iconColor: UIColor {
        return UIColor.itauOrange
    }
    
    public var selectedIconBackgroundColor: UIColor {
        return UIColor.itauOrange
    }
    
    public var selectedIconColor: UIColor {
        return UIColor.itauN0
    }
    
}
