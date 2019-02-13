//
//  SwitchTheme+Segments.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 13/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

/**
 * Theme for 'Varejo' branch.
 */
public struct VarejoSwitchTheme: SwitchTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
}

/**
 * Theme for 'Uniclass' branch.
 */
public struct UniclassSwitchTheme: SwitchTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
}

/**
 * Theme for 'Personnalité' branch.
 */
public struct PersonnaliteSwitchTheme: SwitchTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var onColor: UIColor {
        return UIColor.itauPersonnaliteGold
    }

}

/**
 * Theme for 'Personal Bank' branch.
 */
public struct PersonalBankSwitchTheme: SwitchTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
    public var onColor: UIColor {
        return UIColor.itauPersonalBankGold
    }
    
}

/**
 * Theme for 'Private' branch.
 */
public struct PrivateSwitchTheme: SwitchTheme {
    
    /**
     * Public initializer
     */
    public init(){}
    
}

/**
 * Theme for 'Empresas' branch.
 */
public struct EmpresasSwitchTheme: SwitchTheme {
    
    /**
     * Public initializer
     */
    public init(){}

}

/**
 * Theme for 'Itaucard' branch.
 */
public struct ItaucardSwitchTheme: SwitchTheme {
    
    /**
     * Public initializer
     */
    public init(){}
        
}
