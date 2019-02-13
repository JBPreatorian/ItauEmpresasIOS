//
//  UIColor+Hex.swift
//  iosUiComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 23/10/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name

public extension UIColor {

    public convenience init(hex: String) {
        var red: CGFloat   = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat  = 0.0
        var alpha: CGFloat = 1.0
        
        let scanner = Scanner(string: hex)
        var hexValue: CUnsignedLongLong = 0
        if scanner.scanHexInt64(&hexValue) {
            switch hex.count {
            case 3:
                red   = CGFloat((hexValue & 0xF00) >> 8)       / 15.0
                green = CGFloat((hexValue & 0x0F0) >> 4)       / 15.0
                blue  = CGFloat(hexValue & 0x00F)              / 15.0
            case 4:
                alpha   = CGFloat((hexValue & 0xF000) >> 12)     / 15.0
                red = CGFloat((hexValue & 0x0F00) >> 8)      / 15.0
                green  = CGFloat((hexValue & 0x00F0) >> 4)      / 15.0
                blue = CGFloat(hexValue & 0x000F)             / 15.0
            case 6:
                red   = CGFloat((hexValue & 0xFF0000) >> 16)   / 255.0
                green = CGFloat((hexValue & 0x00FF00) >> 8)    / 255.0
                blue  = CGFloat(hexValue & 0x0000FF)           / 255.0
            case 8:
                alpha = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
                red   = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
                green = CGFloat((hexValue & 0x0000FF00) >> 8)  / 255.0
                blue  = CGFloat(hexValue & 0x000000FF)         / 255.0
            default:
                red = 0.0
                green = 0.0
                blue = 0.0
            }
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
 
    public func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }
    
    public func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }
    
    public func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            return UIColor(red: min(red + percentage/100, 1.0),
                           green: min(green + percentage/100, 1.0),
                           blue: min(blue + percentage/100, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
    
}
