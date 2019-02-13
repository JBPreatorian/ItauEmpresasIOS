//
//  ItaucardTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by inacio.ferrarini on 11/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public protocol ItaucardThemeProtocol: Theme {}

public struct ItaucardTheme: ItaucardThemeProtocol {
    
    public init() {}
    
}


// MARK: - Themes Catalog

public extension ThemeCatalog {
    
    public static var itaucard: ItaucardThemeProtocol {
        return ItaucardTheme()
    }
    
}
