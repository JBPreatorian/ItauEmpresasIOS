//
//  ThemeProtocol.swift
//  iOSUIComponentsCore-iOS
//
//  Created by inacio.ferrarini on 11/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import Foundation

/**
 * Defines the minimal requirements for a Theme
 */
public protocol Theme {
    
    
    // MARK: - Common Elements
    
    var button: ButtonTheme { get }
    var cardView: CardViewTheme { get }
    var `switch`: SwitchTheme { get }
    var tabBar: TabBarTheme { get }
    
    
    // MARK: - Collections
    
    var menuCollectionCell: MenuGridCollectionCellTheme { get }
    
    
    // MARK: - Headers
    
    var appHeader: AppHeaderTheme { get }
    var pageHeader: PageHeaderTheme { get }
    var userInitials: UserInitialsTheme { get }
    
    // MARK: - User Profile
    
    var userProfileOption: UserProfileOptionTheme { get }
    var buttonUserProfileOption: ButtonUserProfileOptionTheme { get }
    var switchUserProfileOption: SwitchUserProfileOptionTheme { get }
    
}
