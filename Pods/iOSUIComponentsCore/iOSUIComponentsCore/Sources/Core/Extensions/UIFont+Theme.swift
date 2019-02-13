//
//  UIFont+Theme.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 12/11/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public extension UIFont {
    
    
    //MARK: - Numbers
    
    public class func itauNumberLargeFont() -> UIFont {
        return UIFont.itauLightFont(withSize: 30)
    }
    
    public class func itauNumberMediumFont() -> UIFont {
        return UIFont.itauLightFont(withSize: 24)
    }
    
    
    //MARK: - Titles
    
    public class func itauTitleLargeFont() -> UIFont {
        return UIFont.itauLightFont(withSize: 24)
    }
    
    public class func itauTitleMediumFont() -> UIFont {
        return UIFont.itauBoldFont(withSize: 16)
    }
    
    
    // MARK: - Texts
    
    public class func itauTextLargeFont() -> UIFont {
        return UIFont.itauRegularFont(withSize: 18)
    }
    
    public class func itauTextMediumFont() -> UIFont {
        return UIFont.itauRegularFont(withSize: 16)
    }
    
    public class func itauTextSmallFont() -> UIFont {
        return UIFont.itauRegularFont(withSize: 14)
    }
    
}
