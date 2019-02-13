//
//  UIImage+Colors.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 09/11/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public extension UIImage {
    
    public static func image(withColor color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
}
