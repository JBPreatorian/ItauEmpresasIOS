//
//  ButtonUserProfileOption.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 29/11/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public protocol ButtonUserProfileOptionDelegate: class {
    func didTapped(on sender: ButtonUserProfileOption)
}

open class ButtonUserProfileOption: UserProfileOption {
    
    weak var delegate: ButtonUserProfileOptionDelegate?
    
    // MARK: - Public Properties
    
    lazy var actionButton: UIButton? = {
        let nib = UINib(nibName: "ButtonUserProfileOptionInsert", bundle: Bundle(for: type(of: self)))
        var actionButton: UIButton?
        if let view = nib.instantiate(withOwner: nil, options: nil).first as? UIView,
            let button = view.subviews.first as? UIButton {
            self.actionView?.addSubview(button)
            actionButton = button
        }
        actionButton?.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        actionButton?.bindEdgesToSuperview()
        return actionButton
    }()
    
    /**
     * Text (or icon) for the action
     *
     * @defaults to
     *
     * @return String?
     */
    @IBInspectable public var actionIcon: String? {
        didSet {
            actionButton?.setTitle(actionIcon, for: .normal)
        }
    }
    
    /**
     * Accessibility Value for action icon
     *
     * @defaults to
     *
     * @return String?
     */
    @IBInspectable public var actionIconAccessibilityValue: String? {
        didSet {
            actionButton?.accessibilityValue = actionIconAccessibilityValue
        }
    }

    /**
     * Accessibility Hint for action icon
     *
     * @defaults to
     *
     * @return String?
     */
    @IBInspectable public var actionIconAccessibilityHint: String? {
        didSet {
            actionButton?.accessibilityHint = actionIconAccessibilityHint
        }
    }
    
    /**
     * Font to be used to render the action
     *
     * @defaults to
     *
     * @return UIFont?
     */
    @IBInspectable public var actionFont: UIFont? {
        didSet {
            actionButton?.titleLabel?.font = actionFont
        }
    }
    
    /**
     * Color to be used to render the action
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var actionColor: UIColor? {
        didSet {
            actionButton?.setTitleColor(actionColor, for: .normal)
        }
    }

    
    // MARK: - Life cycle
    
    override open func applyTheme() {
        guard let theme = self.theme?.buttonUserProfileOption else { return }
        self.actionColor = theme.actionColor
        super.applyTheme(theme: theme)
    }
    
    override open func setupAccessibility() {
        super.setupAccessibility()
        
        self.isAccessibilityElement = true
        
        self.actionButton?.isAccessibilityElement = true
        
        self.actionButton?.accessibilityTraits = XcodeCompat.AccessibilityTraitButton
        
        self.actionButton?.accessibilityLabel = ""
        
        self.actionButton?.accessibilityHint = ""
    }
    
    override open func applyDefaultValues() {
        super.applyDefaultValues()
        if nil == self.actionFont {
            self.actionFont = UIFont.itauFontIcon(withSize: 24)
        }
    }
    
    // MARK: - Action Handling
    
    @objc open func actionButtonTapped() {
        self.delegate?.didTapped(on: self)
    }
    
}
