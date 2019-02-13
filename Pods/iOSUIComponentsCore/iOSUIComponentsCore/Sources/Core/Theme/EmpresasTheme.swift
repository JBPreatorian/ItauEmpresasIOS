//
//  EmpresasTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by inacio.ferrarini on 11/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public protocol EmpresasTheme: Theme {}

public struct EmpresasThemeImpl: EmpresasTheme {
    
    public init() {}
    
}


// MARK: - Themes Catalog

public extension ThemeCatalog {
    
    public static var empresas: EmpresasTheme {
        return EmpresasThemeImpl()
    }
    
}
