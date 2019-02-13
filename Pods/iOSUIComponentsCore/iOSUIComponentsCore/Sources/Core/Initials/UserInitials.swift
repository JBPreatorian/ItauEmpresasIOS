//
//  UserInitials.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 25/10/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit
import Reusable

public enum Size {
    case small
    case large
}

public enum Mode {
    case icon
    case initials
}

public final class UserInitials: UIView, NibOwnerLoadable {
    
    @IBOutlet weak var backgroundView: UIView?
    @IBOutlet weak var nameLabel: UILabel?
    
    /**
     * Theme to be used by this component.
     */
    public var theme: Theme? {
        didSet {
            applyTheme()
        }
    }
    
    
    // MARK: - Public Properties
    
    /**
     * The `name` used to extract the value to be rendered.
     *
     * @param name the Name to be processed and initials extracted.
     *
     * @returns String
     */
    @IBInspectable public var name: String? {
        didSet {
            if let newName = name {
                nameLabel?.text = newName.initials()
            } else {
                nameLabel?.text = ""
            }
        }
    }
    
    /**
     * Font to be used to render the initials
     *
     * @defaults to
     *
     * @return UIFont?
     */
    @IBInspectable public var textFont: UIFont? {
        didSet {
            nameLabel?.font = textFont
        }
    }

    /**
     * Color to be used to render user initials
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var textColor: UIColor? {
        didSet {
            nameLabel?.textColor = textColor
        }
    }
    
    /**
     * The background color to be used to render the initials.
     *
     * @param viewBackgroundColor the color to use.
     *
     * @defaults to
     */
    @IBInspectable public var viewBackgroundColor: UIColor? {
        didSet {
            self.backgroundColor = UIColor.clear
            backgroundView?.backgroundColor = viewBackgroundColor
        }
    }
    
    /**
     * Sets the overall size of the component
     * Changing this property will change the current font size being used.
     */
    public var size: Size? {
        didSet {
            updateSize()
            applyTheme()
        }
    }

    /**
     * Sets the mode of the component.
     * Changing this property will change the current font and color size being used.
     */
    public var mode: Mode? {
        didSet {
            updateSize()
            applyTheme()
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
    
    func setupUI() {
        self.accessibilityElementsHidden = true
        self.applyDefaultValues()
        self.clipsToBounds = true
        self.backgroundView?.clipsToBounds = true
    }
    
    public func applyTheme() {
        guard let theme = self.theme?.userInitials else { return }
        self.applyTheme(theme: theme)
    }

    public func applyTheme(theme: UserInitialsTheme) {
        self.viewBackgroundColor = theme.backgroundColor
        if .icon == self.mode {
            self.textColor = theme.iconTextColor
        } else {
            self.textColor = theme.textColor
        }
    }

    
    func applyDefaultValues() {
        self.theme = Themes.varejo
        if nil == self.textFont {
            self.textFont = UIFont.itauBoldFont(withSize: 14)
        }
        if nil == self.size {
            self.size = .small
        }
        if nil == self.mode {
            self.mode = .initials
        }
    }
    
    func updateSize() {
        if .icon == self.mode {
            self.textColor = UIColor.itauN40
            if .large == self.size {
                self.textFont = UIFont.itauFontIcon(withSize: 48)
            } else {
                self.textFont = UIFont.itauFontIcon(withSize: 24)
            }
        } else {
            if .large == self.size {
                self.textFont = UIFont.itauBoldFont(withSize: 24)
            } else {
                self.textFont = UIFont.itauBoldFont(withSize: 14)
            }
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundView?.layer.borderWidth = 0
        self.backgroundView?.layer.cornerRadius = self.frame.size.width / 2
    }
    
}
