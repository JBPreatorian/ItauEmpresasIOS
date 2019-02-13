//
//  VarejoTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by inacio.ferrarini on 11/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public protocol VarejoTheme: Theme {}

public struct VarejoThemeImpl: VarejoTheme {
    
    public init() {}
    
}


// MARK: - Themes Catalog

public extension ThemeCatalog {
    
    public static var varejo: VarejoTheme {
        return VarejoThemeImpl()
    }

}
