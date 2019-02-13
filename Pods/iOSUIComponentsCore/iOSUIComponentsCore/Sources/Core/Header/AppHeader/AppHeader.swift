//
//  AppHeader.swift
//  iosUiComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 24/10/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit
import Reusable

@IBDesignable public final class AppHeader: HeaderView, NibOwnerLoadable {

    
    // MARK: - Public Properties
    
    @IBOutlet weak public private(set) var userInitials: UserInitials?
    
    
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
        self.userInitials?.isAccessibilityElement = false
    }
    
    override func applyDefaultValues() {
        super.applyDefaultValues()
        self.userInitials?.mode = .initials
        self.userInitials?.size = .small
    }

    override func applyTheme() {
        super.applyTheme()
        
        guard let theme = self.theme?.appHeader else { return }
        
        self.titleColor = theme.titleColor
        self.subtitleColor = theme.subtitleColor
        self.firstActionButtonTitleColor = theme.actionColor
        self.secondActionButtonTitleColor = theme.actionColor
        self.userInitials?.applyTheme(theme: theme.userInitialsTheme)
    }
    
}



