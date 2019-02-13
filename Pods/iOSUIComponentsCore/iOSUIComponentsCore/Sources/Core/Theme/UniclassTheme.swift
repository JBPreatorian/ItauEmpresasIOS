//
//  UniclassTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by inacio.ferrarini on 11/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public protocol UniclassTheme: Theme {}

public struct UniclassThemeImpl: UniclassTheme {
    
    public init() {}
    
}


// MARK: - Themes Catalog

public extension ThemeCatalog {
    
    public static var uniclass: UniclassTheme {
        return UniclassThemeImpl()
    }
    
}
