//
//  SwitchUserProfileOption.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 03/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public protocol SwitchUserProfileOptionDelegate: class {
    func switchValueChanged(on sender: SwitchUserProfileOption, isOn: Bool)
}

open class SwitchUserProfileOption: UserProfileOption {
    
    weak var delegate: SwitchUserProfileOptionDelegate?
    
    // MARK: - Public Properties
    
    lazy var optionSwitch: Switch? = {
        let nib = UINib(nibName: "SwitchUserProfileOptionInsert", bundle: Bundle(for: type(of: self)))
        var optionSwitch: Switch?
        if let view = nib.instantiate(withOwner: nil, options: nil).first as? UIView,
            let innerOptionSwitch = view.subviews.first as? Switch {
            self.actionView?.addSubview(innerOptionSwitch)
            optionSwitch = innerOptionSwitch
        }
        optionSwitch?.addTarget(self, action: #selector(switchOptionChanged), for: .valueChanged)
        optionSwitch?.centerInSuperview()
        return optionSwitch
    }()
    
    /**
     * Accessibility Value for action icon
     *
     * @defaults to
     *
     * @return String?
     */
    @IBInspectable public var switchAccessibilityValue: String? {
        didSet {
            optionSwitch?.accessibilityValue = switchAccessibilityValue
        }
    }

    /**
     * Accessibility Hint for action icon
     *
     * @defaults to
     *
     * @return String?
     */
    @IBInspectable public var switchAccessibilityHint: String? {
        didSet {
            optionSwitch?.accessibilityHint = switchAccessibilityHint
        }
    }
    
    
    // MARK: - Life cycle
    
    override open func setupAccessibility() {
        super.setupAccessibility()
        
        self.isAccessibilityElement = true
        
        self.optionSwitch?.isAccessibilityElement = true
        
        self.optionSwitch?.accessibilityTraits = XcodeCompat.AccessibilityTraitStaticText
        
        self.optionSwitch?.accessibilityLabel = ""
        
        self.optionSwitch?.accessibilityHint = ""
    }
    
    override open func applyTheme() {
        guard let theme = self.theme?.switchUserProfileOption else { return }
        super.applyTheme(theme: theme)
        self.optionSwitch?.applyTheme(theme: theme.switch)
    }
    
    // MARK: - Action Handling
    
    @objc open func switchOptionChanged() {
        if let optionSwitch = self.optionSwitch {
            self.delegate?.switchValueChanged(on: self, isOn: optionSwitch.isOn)
        }
    }
    
}
