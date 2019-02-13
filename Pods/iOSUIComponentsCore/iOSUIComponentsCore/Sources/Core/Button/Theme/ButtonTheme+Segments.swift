//
//  ButtonTheme+Segments.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 13/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit


/**
 * Theme for 'Varejo' branch.
 */
public struct VarejoButtonTheme: ButtonTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var primary: ButtonStyleTheme {
        return DefaultPrimaryButtonStyleTheme()
    }

    public var secondary: ButtonStyleTheme {
        return DefaultSecondaryButtonStyleTheme()
    }
    
    public var ghost: OutlineButtonStyleTheme {
        return DefaultGhostButtonStyleTheme()
    }
    
    public var ghostGray: OutlineButtonStyleTheme {
        return DefaultGhostGrayButtonStyleTheme()
    }
    
    public var link: ButtonStyleTheme {
        return DefaultLinkButtonStyleTheme()
    }
    
}

/**
 * Theme for 'Uniclass' branch.
 */
public struct UniclassButtonTheme: ButtonTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var primary: ButtonStyleTheme {
        return DefaultPrimaryButtonStyleTheme()
    }
    
    public var secondary: ButtonStyleTheme {
        return DefaultSecondaryButtonStyleTheme()
    }
    
    public var ghost: OutlineButtonStyleTheme {
        return DefaultGhostButtonStyleTheme()
    }
    
    public var ghostGray: OutlineButtonStyleTheme {
        return DefaultGhostGrayButtonStyleTheme()
    }

    public var link: ButtonStyleTheme {
        return DefaultLinkButtonStyleTheme()
    }
    
}

/**
 * Theme for 'Personnalité' branch.
 */
public struct PersonnaliteButtonTheme: ButtonTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var primary: ButtonStyleTheme {
        return PersonnalitePrimaryButtonStyleTheme()
    }
    
    public var secondary: ButtonStyleTheme {
        return DefaultSecondaryButtonStyleTheme()
    }
    
    public var ghost: OutlineButtonStyleTheme {
        return PersonnaliteGhostButtonStyleTheme()
    }

    public var ghostGray: OutlineButtonStyleTheme {
        return DefaultGhostGrayButtonStyleTheme()
    }
    
    public var link: ButtonStyleTheme {
        return DefaultLinkButtonStyleTheme()
    }
    
}

/**
 * Theme for 'Personal Bank' branch.
 */
public struct PersonalBankButtonTheme: ButtonTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var primary: ButtonStyleTheme {
        return PersonalBankPrimaryButtonStyleTheme()
    }
    
    public var secondary: ButtonStyleTheme {
        return DefaultSecondaryButtonStyleTheme()
    }
    
    public var ghost: OutlineButtonStyleTheme {
        return PersonalBankGhostButtonStyleTheme()
    }
    
    public var ghostGray: OutlineButtonStyleTheme {
        return DefaultGhostGrayButtonStyleTheme()
    }

    public var link: ButtonStyleTheme {
        return DefaultLinkButtonStyleTheme()
    }
    
}

/**
 * Theme for 'Private' branch.
 */
public struct PrivateButtonTheme: ButtonTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var primary: ButtonStyleTheme {
        return DefaultPrimaryButtonStyleTheme()
    }
 
    public var secondary: ButtonStyleTheme {
        return DefaultSecondaryButtonStyleTheme()
    }
    
    public var ghost: OutlineButtonStyleTheme {
        return DefaultGhostButtonStyleTheme()
    }
    
    public var ghostGray: OutlineButtonStyleTheme {
        return DefaultGhostGrayButtonStyleTheme()
    }

    public var link: ButtonStyleTheme {
        return DefaultLinkButtonStyleTheme()
    }
    
}

/**
 * Theme for 'Empresas' branch.
 */
public struct EmpresasButtonTheme: ButtonTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var primary: ButtonStyleTheme {
        return DefaultPrimaryButtonStyleTheme()
    }
    
    public var secondary: ButtonStyleTheme {
        return DefaultSecondaryButtonStyleTheme()
    }
    
    public var ghost: OutlineButtonStyleTheme {
        return DefaultGhostButtonStyleTheme()
    }

    public var ghostGray: OutlineButtonStyleTheme {
        return DefaultGhostGrayButtonStyleTheme()
    }
    
    public var link: ButtonStyleTheme {
        return DefaultLinkButtonStyleTheme()
    }
    
}

/**
 * Theme for 'Itaucard' branch.
 */
public struct ItaucardButtonTheme: ButtonTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var primary: ButtonStyleTheme {
        return DefaultPrimaryButtonStyleTheme()
    }
    
    public var secondary: ButtonStyleTheme {
        return DefaultSecondaryButtonStyleTheme()
    }
    
    public var ghost: OutlineButtonStyleTheme {
        return DefaultGhostButtonStyleTheme()
    }

    public var ghostGray: OutlineButtonStyleTheme {
        return DefaultGhostGrayButtonStyleTheme()
    }
    
    public var link: ButtonStyleTheme {
        return DefaultLinkButtonStyleTheme()
    }
    
}
