//
//  Font.swift
//  ItauTheme
//
//  Created by Diogo Autilio / Bruno Fernandes on 22/12/17.
//  Copyright (c) 2017-2018 Itau. All rights reserved.
//

import UIKit

public extension UIFont {

    private enum ItauFont: String {
        case icons = "itaufonts_master_24px_v1"
        case regular = "ItauTextApp-Regular"
        case light = "ItauTextApp-Light"
        case bold = "ItauTextApp-Bold"
        case xBold = "ItauTextApp-XBold"
    }

    /// Swift < 4.0 support
    #if !(swift(>=4.0))
    private enum Weight {
        static let light = UIFontWeightLight
        static let bold = UIFontWeightBold
        static let heavy = UIFontWeightHeavy
    }
    #endif

    /**
     Use Itaú Regular font.
     
     - Parameter size: Create a Regular font with the specified size.
     
     - Returns: A Itaú Regular font.
     */
    @objc
    public class func itauRegularFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: ItauFont.regular.rawValue, size: size)
            ?? UIFont.systemFont(ofSize: size)
    }

    /**
     Use Itaú Light font.
     
     - Parameter size: Create a Light font with the specified size.
     
     - Returns: A Itaú Light font.
     */
    @objc
    public class func itauLightFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: ItauFont.light.rawValue, size: size)
            ?? UIFont.systemFont(ofSize: size, weight: UIFont.Weight.light)
    }

    /**
     Use Itaú Bold font.
     
     - Parameter size: Create a Bold font with the specified size.
     
     - Returns: A Itaú Bold font.
     */
    @objc
    public class func itauBoldFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: ItauFont.bold.rawValue, size: size)
            ?? UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
    }

    /**
     Use Itaú XBold font.
     
     - Parameter size: Create a XBold font with the specified size.
     
     - Returns: A Itaú XBold font.
     */
    @objc
    public class func itauXBoldFont(withSize size: CGFloat) -> UIFont {
        return UIFont(name: ItauFont.xBold.rawValue, size: size)
            ?? UIFont.systemFont(ofSize: size, weight: UIFont.Weight.heavy)
    }

    /**
     Use Itaú Icon font.
     
     - Parameters:
     - with: The font icon identifier.
     - size: Create a Icon font with the specified size.
     
     - Returns: A Itaú Icon font.
     */
    @objc
    public class func itauFontIcon(withSize size: CGFloat) -> UIFont {
        return UIFont(name: ItauFont.icons.rawValue, size: size)
            ?? UIFont.systemFont(ofSize: size)
    }
}
