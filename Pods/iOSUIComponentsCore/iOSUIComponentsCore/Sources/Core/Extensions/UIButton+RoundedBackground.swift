//
//  UIButton+RoundedBackground.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 17/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public extension UIButton {
    
    func setBackgroundImageClippedToBounds(_ image: UIImage, for state: XcodeCompat.ControlStateType) {
        if !(layer.cornerRadius != 0.0) {
            setBackgroundImage(image, for: state)
            return
        }
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
        UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).addClip()
        image.draw(in: bounds)
        let clippedBackgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        setBackgroundImage(clippedBackgroundImage, for: state)
    }
}
