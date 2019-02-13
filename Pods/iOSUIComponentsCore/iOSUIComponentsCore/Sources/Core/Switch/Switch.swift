//
//  Switch.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 30/11/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

open class Switch: UISwitch {

    // MARK: - Public Properties
    
    /**
     * Theme to be used by this component.
     */
    public var theme: Theme? {
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
    
    
    // MARK: - Setup
    
    func setupUI() {
        self.applyDefaultValues()
    }
    
    func applyDefaultValues() {
        self.theme = Themes.varejo
    }
    
    
    // MARK: - Appearance
    
    open func applyTheme() {
        guard let theme = self.theme?.switch else { return }
        self.applyTheme(theme: theme)
    }
    
    func applyTheme(theme: SwitchTheme) {
        self.onTintColor = theme.onColor
    }
    
}
