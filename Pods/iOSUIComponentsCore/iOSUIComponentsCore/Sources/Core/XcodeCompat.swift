//
//  XcodeCompat.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 31/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public struct XcodeCompat {
    
#if XCODE9
    
    public static let AccessibilityTraitImage = UIAccessibilityTraitImage
    public static let AccessibilityTraitStaticText = UIAccessibilityTraitStaticText
    public static let AccessibilityTraitButton = UIAccessibilityTraitButton
    public static let AccessibilityTraitHeader = UIAccessibilityTraitHeader
    
    public typealias ControlStateType = UIControlState
    
#elseif XCODE10
    
    public static let AccessibilityTraitImage = UIAccessibilityTraits.image
    public static let AccessibilityTraitStaticText = UIAccessibilityTraits.staticText
    public static let AccessibilityTraitButton =  UIAccessibilityTraits.button
    public static let AccessibilityTraitHeader = UIAccessibilityTraits.header
    
    public typealias ControlStateType = UIControl.State
    
#endif
    
}
