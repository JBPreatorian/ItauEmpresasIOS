//
//  UserProfileOptionView.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 29/11/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit
import Reusable

@IBDesignable open class UserProfileOption: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var iconLabel: UILabel?
    @IBOutlet weak var textLabel: UILabel?
    @IBOutlet weak var actionView: UIView?
    
    /**
     * Theme to be used by this component.
     */
    public var theme: Theme? {
        didSet {
            applyTheme()
        }
    }

    
    // MARK: - Public Properties
    
    @IBInspectable public var icon: String? {
        didSet {
            iconLabel?.text = icon
        }
    }
  
    /**
     * Accessibility Value for left icon
     *
     * @defaults to
     *
     * @return String?
     */
    @IBInspectable public var iconAccessibilityValue: String? {
        didSet {
            iconLabel?.accessibilityValue = iconAccessibilityValue
        }
    }

    /**
     * Accessibility Hint for left icon
     *
     * @defaults to
     *
     * @return String?
     */
    @IBInspectable public var iconAccessibilityHint: String? {
        didSet {
            iconLabel?.accessibilityHint = iconAccessibilityHint
        }
    }
    
    /**
     * Font to be used to render the icon
     *
     * @defaults to
     *
     * @return UIFont?
     */
    @IBInspectable public var iconFont: UIFont? {
        didSet {
            iconLabel?.font = iconFont
        }
    }

    /**
     * Color to be used to render the icon
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var iconColor: UIColor? {
        didSet {
            iconLabel?.textColor = iconColor
        }
    }
    
    
    @IBInspectable public var text: String? {
        didSet {
            textLabel?.text = text
        }
    }
    
    /**
     * Accessibility Value for text
     *
     * @defaults to
     *
     * @return String?
     */
    @IBInspectable public var textAccessibilityValue: String? {
        didSet {
            textLabel?.accessibilityValue = textAccessibilityValue
        }
    }

    /**
     * Accessibility Hint for text
     *
     * @defaults to
     *
     * @return String?
     */
    @IBInspectable public var textAccessibilityHint: String? {
        didSet {
            textLabel?.accessibilityHint = textAccessibilityHint
        }
    }
    
    /**
     * Font to be used to render the text
     *
     * @defaults to
     *
     * @return UIFont?
     */
    @IBInspectable public var textFont: UIFont? {
        didSet {
            textLabel?.font = textFont
        }
    }
    
    /**
     * Color to be used to render the text
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var textColor: UIColor? {
        didSet {
            textLabel?.textColor = textColor
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
        setupUI()
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    open func setupUI() {
        self.accessibilityElementsHidden = true
        self.applyDefaultValues()
        self.clipsToBounds = true
        self.setupAccessibility()
    }
    
    open func setupAccessibility() {
        self.isAccessibilityElement = true
        
        self.iconLabel?.isAccessibilityElement = true
        self.textLabel?.isAccessibilityElement = true
        
        self.iconLabel?.accessibilityTraits = XcodeCompat.AccessibilityTraitImage
        self.textLabel?.accessibilityTraits = XcodeCompat.AccessibilityTraitStaticText

        self.iconLabel?.accessibilityLabel = ""
        self.textLabel?.accessibilityLabel = ""

        self.iconLabel?.accessibilityHint = ""
        self.textLabel?.accessibilityHint = ""
    }
    
    open func applyTheme() {
        guard let theme = self.theme?.userProfileOption else { return }
        self.applyTheme(theme: theme)
    }

    func applyTheme(theme: UserProfileOptionTheme) {
        self.backgroundColor = theme.backgroundColor
        self.iconColor = theme.iconColor
        self.textColor = theme.textColor
    }
    
    open func applyDefaultValues() {
        self.theme = Themes.varejo
        if nil == self.iconFont {
            self.iconFont = UIFont.itauFontIcon(withSize: 24)
        }
        if nil == self.textFont {
            self.textFont = UIFont.itauTextMediumFont()
        }
    }
    
}
