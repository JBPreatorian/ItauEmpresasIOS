//
//  MenuGridCollectionCell.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Thiago Lioy, Inácio Ferrarini on 05/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit
import Reusable

public enum MenuGridCollectionCellStyle {
    case theme
    case blue
}

public class MenuGridCollectionCell: UICollectionViewCell {

    private static let smallWidth: CGFloat = 24.0
    private static let largeWidth: CGFloat = 40.0
    
    @IBOutlet weak var iconLabel: UILabel?
    @IBOutlet weak var textLabel: UILabel?
    
    @IBOutlet weak var badgeLabelBgView: UIView?
    @IBOutlet weak var badgeLabel: UILabel?
    @IBOutlet var badgeWidthConstraint: NSLayoutConstraint?
    
    private static let cellRatio: CGFloat = 1.4166666667
    private static let expandedCellRatio: CGFloat = 0.8947368421
    
    /**
     * Theme to be used by this component.
     */
    public var theme: Theme? {
        didSet {
            applyTheme()
        }
    }
    
    public var style: MenuGridCollectionCellStyle = .theme {
        didSet {
            applyTheme()
        }
    }
    
    override public var isSelected: Bool {
        didSet {
            applyTheme()
        }
    }
    
    override public var isHighlighted: Bool {
        didSet {
            applyTheme()
        }
    }

    public func setup(with item: MenuNodeModel) {
        self.setupUI()
        if !item.icon.isEmpty {
            iconLabel?.text = item.icon
        } else {
            iconLabel?.text = ""
        }
        let name = item.name
        textLabel?.text = name
        setupBadge(item.badge)
        self.setupAccessibility(with: name)
    }

    func setupBadge(_ count: Int) {
        let isHidden = (count == 0)
        badgeLabel?.isHidden = isHidden
        badgeLabelBgView?.isHidden = isHidden
        if (count < 99) {
            badgeLabel?.text = "\(count)"
            badgeWidthConstraint?.constant = MenuGridCollectionCell.smallWidth
            badgeLabel?.layoutIfNeeded()
            badgeLabelBgView?.layoutIfNeeded()
        } else {
            badgeLabel?.text = "+99"
            badgeWidthConstraint?.constant = MenuGridCollectionCell.largeWidth
            badgeLabel?.layoutIfNeeded()
            badgeLabelBgView?.layoutIfNeeded()
        }
    }
    
    func setupAccessibility(with value: String) {
        self.iconLabel?.isAccessibilityElement = false
        self.isAccessibilityElement = true
        self.accessibilityValue = value
        self.accessibilityTraits = XcodeCompat.AccessibilityTraitButton
    }
    
    func setupUI() {
        self.applyTheme()
        self.iconLabel?.font = UIFont.itauFontIcon(withSize: 24)
        self.textLabel?.font = UIFont.itauTextMediumFont()
        self.badgeLabel?.font = UIFont.itauBoldFont(withSize: 14)
    }
    
    func applyTheme() {
        guard let theme = self.theme?.menuCollectionCell else { return }
        
        if .theme == style {
            self.applyTheme(theme: theme.theme)
        } else {
            self.applyTheme(theme: theme.blue)
        }
        self.layer.roundCorners(radius: 4)
        self.layer.addShadow()

        self.badgeLabelBgView?.layer.roundCorners(radius: 12)
        self.badgeLabelBgView?.layer.addShadow()

    }
    
    func applyTheme(theme: MenuGridColletionCellStyleTheme) {
        self.iconLabel?.textColor = theme.iconColor
        self.textLabel?.textColor = theme.textColor
        if isSelected || isHighlighted {
            self.backgroundColor = theme.selectedBackgroundColor
        } else {
            self.backgroundColor = theme.backgroundColor
        }
        self.badgeLabel?.textColor = theme.badgeTextColor
        self.badgeLabelBgView?.backgroundColor = theme.badgeBackgroundColor
    }
    
}

extension MenuGridCollectionCell: NibReusable {}
