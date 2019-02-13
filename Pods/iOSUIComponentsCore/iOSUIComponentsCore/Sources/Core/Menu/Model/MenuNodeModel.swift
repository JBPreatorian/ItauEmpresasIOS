//
//  MenuNodeModel.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Thiago Lioy, Inácio Ferrarini on 05/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import Foundation

public struct MenuNodeModel {
    
    public let icon: String
    public let name: String
    public let badge: Int
    
    public init(icon: String, name: String, badge: Int = 0) {
        self.icon = icon
        self.name = name
        self.badge = badge
    }
    
}
