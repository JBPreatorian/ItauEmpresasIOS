//
//  AppHeaderTheme+Segments.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 13/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit


/**
 * Theme for 'Varejo' branch.
 */
public struct VarejoAppHeaderTheme: AppHeaderTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    
    public var userInitialsTheme: UserInitialsTheme {
        return VarejoUserInitialsTheme()
    }
    
}

/**
 * Theme for 'Uniclass' branch.
 */
public struct UniclassAppHeaderTheme: AppHeaderTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var titleColor: UIColor {
        return UIColor.itauBlue
    }
    
    public var userInitialsTheme: UserInitialsTheme {
        return UniclassUserInitialsTheme()
    }
    
}

/**
 * Theme for 'Personnalité' branch.
 */
public struct PersonnaliteAppHeaderTheme: AppHeaderTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var titleColor: UIColor {
        return UIColor.itauChocolate
    }
    
    public var actionColor: UIColor {
        return UIColor.itauChocolate
    }
    
    public var userInitialsTheme: UserInitialsTheme {
        return PersonnaliteUserInitialsTheme()
    }

}

/**
 * Theme for 'Personal Bank' branch.
 */
public struct PersonalBankAppHeaderTheme: AppHeaderTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var titleColor: UIColor {
        return UIColor.itauPersonalBankCopper
    }
    
    public var actionColor: UIColor {
        return UIColor.itauPersonalBankCopper
    }
    
    public var userInitialsTheme: UserInitialsTheme {
        return PersonalBankUserInitialsTheme()
    }
    
}

/**
 * Theme for 'Private' branch.
 */
public struct PrivateAppHeaderTheme: AppHeaderTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var userInitialsTheme: UserInitialsTheme {
        return PrivateUserInitialsTheme()
    }
    
}

/**
 * Theme for 'Empresas' branch.
 */
public struct EmpresasAppHeaderTheme: AppHeaderTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var userInitialsTheme: UserInitialsTheme {
        return EmpresasAppHeaderAvatarTheme()
    }
    
}

public struct EmpresasAppHeaderAvatarTheme: UserInitialsTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var backgroundColor: UIColor {
        return UIColor.itauEmpresasBlue
    }
        
    public var iconTextColor: UIColor {
        return UIColor.itauN0
    }
    
    public var textColor: UIColor {
        return UIColor.itauN0
    }
    
}


/**
 * Theme for 'Itaucard' branch.
 */
public struct ItaucardAppHeaderTheme: AppHeaderTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var userInitialsTheme: UserInitialsTheme {
        return ItaucardUserInitialsTheme()
    }
    
}

