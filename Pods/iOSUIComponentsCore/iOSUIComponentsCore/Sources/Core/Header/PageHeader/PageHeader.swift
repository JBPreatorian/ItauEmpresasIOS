//
//  PageHeader.swift
//  iOSUIComponentsCoreTests-iOS
//
//  Created by Inácio Ferrarini on 12/11/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit
import Reusable

@IBDesignable public final class PageHeader: HeaderView, NibOwnerLoadable {
    
    @IBOutlet weak var leftActionButton: UIButton?
    
    /**
     * Accessibility Value for left action button
     *
     * @defaults to
     *
     * @return String?
     */
    @IBInspectable public var leftActionButtonAccessibilityValue: String? {
        didSet {
            leftActionButton?.accessibilityValue = leftActionButtonAccessibilityValue
        }
    }
    
    /**
     * Accessibility Hint for left action button
     *
     * @defaults to
     *
     * @return String?
     */
    @IBInspectable public var leftActionButtonAccessibilityHint: String? {
        didSet {
            leftActionButton?.accessibilityHint = leftActionButtonAccessibilityHint
        }
    }
    
    
    // MARK: - Initialization
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadNibContent()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNibContent()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func setupAccessibility() {
        super.setupAccessibility()
        
        self.leftActionButton?.isAccessibilityElement = true
        
        self.leftActionButton?.accessibilityTraits = XcodeCompat.AccessibilityTraitButton
        
        self.leftActionButton?.accessibilityLabel = ""
        
        self.leftActionButton?.accessibilityHint = ""
    }

    override func applyDefaultValues() {
        super.applyDefaultValues()
        if nil == leftActionButtonFont {
            self.leftActionButtonFont = UIFont.itauFontIcon(withSize: 24)
        }
    }
    
    override func applyTheme() {
        super.applyTheme()
        
        guard let theme = self.theme?.pageHeader else { return }
        
        self.titleFont = UIFont.itauTextMediumFont()
        self.subtitleFont = UIFont.itauTextSmallFont()
        self.titleColor = theme.titleColor
        self.subtitleColor = theme.subtitleColor
        self.leftActionButtonTitleColor = theme.actionColor
        self.firstActionButtonTitleColor = theme.actionColor
        self.secondActionButtonTitleColor = theme.actionColor
    }
    
    /**
     * Color to be used to render left action button title
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var leftActionButtonTitleColor: UIColor? {
        didSet {
            leftActionButton?.setTitleColor(leftActionButtonTitleColor, for: .normal)
        }
    }

    /**
     * Font to be used to render left action button title
     *
     * @defaults to
     *
     * @return UIFont?
     */
    @IBInspectable public var leftActionButtonFont: UIFont? {
        didSet {
            leftActionButton?.titleLabel?.font = leftActionButtonFont
        }
    }
    
    
    // MARK: - Actions
    
    override public func setAction(type: HeaderActionType, icon: String?) {
        super.setAction(type: type, icon: icon)
        
        if .leftAction == type {
            enableActionButton(button: self.leftActionButton, icon: icon)
        }
    }
    
    override public func removeAction(type: HeaderActionType) {
        super.removeAction(type: type)
        if .leftAction == type {
            disableActionButton(button: self.leftActionButton)
        }
    }
    
    
    // MARK: - Actions
    
    /**
     * Handles tap over the left action.
     */
    @IBAction func handleLeftActionTap() {
        guard let enabled = self.leftActionButton?.isEnabled, enabled == true else { return }
        self.delegate?.didTap(on: .leftAction)
    }
    
}
