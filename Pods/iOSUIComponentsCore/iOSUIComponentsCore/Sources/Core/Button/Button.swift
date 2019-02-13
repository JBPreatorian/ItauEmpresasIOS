//
//  Button.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 09/11/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public enum GhostStyleButton {
    case `default`
    case `gray`
}

public enum ButtonStyle {
    case primary
    case secondary
    case ghost(GhostStyleButton)
    case link
}

@IBDesignable final public class Button: UIButton {
    
    override public var isEnabled: Bool {
        didSet {
            super.isEnabled = isEnabled
            self.applyTheme()
        }
    }
    
    /**
     * Theme to be used by this component.
     */
    public var theme: Theme? {
        didSet {
            applyTheme()
        }
    }

    public var style: ButtonStyle? {
        didSet {
            applyTheme()
        }
    }
    
    // MARK: - Initialization
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        self.applyDefaultValues()
    }
    
    func applyDefaultValues() {
        self.theme = Themes.varejo
    }
    
    /**
     * Sets Background color.
     */
    public func setBackgroundColor(_ color: UIColor, for state: XcodeCompat.ControlStateType) {
        if let backgroundImage = UIImage.image(withColor: color) {
            self.setBackgroundImageClippedToBounds(backgroundImage, for: state)
        }
    }
    
    func applyTheme() {
        guard let style = style else { return }
        guard let theme = self.theme?.button else { return }
        titleLabel?.font = UIFont.itauBoldFont(withSize: 16)
        switch style {
        case .primary:
            self.layer.addShadow()
            self.layer.roundCorners(radius: 4)
            self.layer.borderWidth = 0
            self.setStyle(theme.primary)
        case .secondary:
            self.layer.addShadow()
            self.layer.roundCorners(radius: 4)
            self.layer.borderWidth = 0
            self.setStyle(theme.secondary)
        case .ghost(let ghostStyleButton):
            var ghostTheme = theme.ghost
            if ghostStyleButton == .gray {
                ghostTheme = theme.ghostGray
            }
            layer.borderWidth = 1
            self.layer.roundCorners(radius: 4)
            self.setStyle(ghostTheme)
            self.setOutline(ghostTheme)
            
        case .link:
            layer.borderWidth = 0
            self.setStyle(theme.link)
        }
        
    }
    
}

extension Button {
    
    func setStyle(_ style: ButtonStyleTheme) {
        setTitleColor(style.normalTitleColor, for: .normal)
        setBackgroundColor(style.normalBackgroundColor, for: .normal)
        setTitleColor(style.highlightedTitleColor, for: .highlighted)
        setBackgroundColor(style.highlightedBackgroundColor, for: .highlighted)
        setTitleColor(style.disabledTitleColor, for: .disabled)
        setBackgroundColor(style.disabledBackgroundColor, for: .disabled)
    }
    
    func setOutline(_ style: OutlineButtonStyleTheme) {
        if self.isEnabled {
            layer.borderColor = style.outlineColor.cgColor
        } else {
            layer.borderColor = style.disabledOutlineColor.cgColor
        }
    }
    
}


