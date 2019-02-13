//
//  MenuGriddCollectionCellTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 14/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

/**
 * Theme for Switch
 */
public protocol MenuGridCollectionCellTheme {
    
    var theme: MenuGridColletionCellStyleTheme { get }
    var blue: MenuGridColletionCellStyleTheme { get }
    
}

public protocol MenuGridColletionCellStyleTheme {
    
    var iconColor: UIColor { get }
    var textColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var selectedBackgroundColor: UIColor { get }
    var badgeTextColor: UIColor { get }
    var badgeBackgroundColor: UIColor { get }
    
}
