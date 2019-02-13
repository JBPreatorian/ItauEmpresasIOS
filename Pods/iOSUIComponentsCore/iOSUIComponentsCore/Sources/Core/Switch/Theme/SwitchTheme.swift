//
//  SwitchTheme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 13/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

/**
 * Theme for Switch
 */
public protocol SwitchTheme {

    var onColor: UIColor { get }

}

public extension SwitchTheme {
    
    public var onColor: UIColor {
        return UIColor.itauOrange
    }
    
}
