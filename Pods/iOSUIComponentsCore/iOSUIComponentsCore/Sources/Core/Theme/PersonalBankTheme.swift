//
//  PersonalBankTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by inacio.ferrarini on 11/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import Foundation

public protocol PersonalBankTheme: Theme {}

public struct PersonalBankThemeImpl: PersonalBankTheme {
    
    public init() {}
    
}


// MARK: - Themes Catalog

public extension ThemeCatalog {
    
    public static var personalBank: PersonalBankTheme {
        return PersonalBankThemeImpl()
    }
    
}
