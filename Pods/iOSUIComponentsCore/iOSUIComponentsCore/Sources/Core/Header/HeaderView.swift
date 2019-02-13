//
//  ActioHeaderView.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 12/11/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit

public enum HeaderActionType {
    case leftAction
    case header
    case firstAction
    case secondAction
}

public struct HeaderAction {
    let type: HeaderActionType
    let icon: String?
}

public protocol HeaderDelegate: class {
    func didTap(on action: HeaderActionType)
}

public class HeaderView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var firstActionButton: UIButton?
    @IBOutlet weak var secondActionButton: UIButton?
    @IBOutlet weak var tapRecognizer: UITapGestureRecognizer?
    public weak var delegate: HeaderDelegate?
    
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
     * Header top text
     */
    @IBInspectable public var title: String? {
        didSet {
            titleLabel?.text = title
            titleLabel?.accessibilityValue = title
        }
    }

    /**
     * Header bottom text
     */
    @IBInspectable public var subtitle: String? {
        didSet {
            subtitleLabel?.text = subtitle
            subtitleLabel?.accessibilityValue = subtitle
        }
    }

    /**
     * Color to be used to render title
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var titleColor: UIColor? {
        didSet {
            titleLabel?.textColor = titleColor
        }
    }
    
    /**
     * Color to be used to render subtitle
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var subtitleColor: UIColor? {
        didSet {
            subtitleLabel?.textColor = subtitleColor
        }
    }
    
    /**
     * Color to be used to render title
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var titleFont: UIFont? {
        didSet {
            titleLabel?.font = titleFont
        }
    }
    
    /**
     * Color to be used to render subtitle
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var subtitleFont: UIFont? {
        didSet {
            subtitleLabel?.font = subtitleFont
        }
    }
    
    /**
     * Accessibility Value for first action button
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var firstActionButtonAccessibilityValue: String? {
        didSet {
            firstActionButton?.accessibilityValue = firstActionButtonAccessibilityValue
        }
    }
    
    /**
     * Accessibility Value for second action button
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var secondActionButtonAccessibilityValue: String? {
        didSet {
            secondActionButton?.accessibilityValue = secondActionButtonAccessibilityValue
        }
    }

    /**
     * Accessibility Hint for first action button
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var firstActionButtonAccessibilityHint: String? {
        didSet {
            firstActionButton?.accessibilityHint = firstActionButtonAccessibilityHint
        }
    }
    
    /**
     * Accessibility Hint for second action button
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var secondActionButtonAccessibilityHint: String? {
        didSet {
            secondActionButton?.accessibilityHint = secondActionButtonAccessibilityHint
        }
    }
    
    /**
     * Color to be used to render first action button title
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var firstActionButtonTitleColor: UIColor? {
        didSet {
            firstActionButton?.setTitleColor(firstActionButtonTitleColor, for: .normal)
        }
    }
    
    /**
     * Color to be used to render second action button title
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var secondActionButtonTitleColor: UIColor? {
        didSet {
            secondActionButton?.setTitleColor(secondActionButtonTitleColor, for: .normal)
        }
    }
    
    /**
     * Font to be used to render second action button title
     *
     * @defaults to
     *
     * @return UIFont?
     */
    @IBInspectable public var firstActionButtonFont: UIFont? {
        didSet {
            firstActionButton?.titleLabel?.font = firstActionButtonFont
        }
    }
    
    /**
     * Font to be used to render second action button title
     *
     * @defaults to
     *
     * @return UIFont?
     */
    @IBInspectable public var secondActionButtonFont: UIFont? {
        didSet {
            secondActionButton?.titleLabel?.font = secondActionButtonFont
        }
    }
    
    func setupUI() {
        self.setupAccessibility()
        self.applyDefaultValues()
    }
    
    func setupAccessibility() {
        self.isAccessibilityElement = true
        self.titleLabel?.isAccessibilityElement = true
        self.subtitleLabel?.isAccessibilityElement = true
        self.firstActionButton?.isAccessibilityElement = true
        self.secondActionButton?.isAccessibilityElement = true
        
        self.accessibilityTraits = XcodeCompat.AccessibilityTraitHeader
        self.titleLabel?.accessibilityTraits = XcodeCompat.AccessibilityTraitStaticText
        self.subtitleLabel?.accessibilityTraits = XcodeCompat.AccessibilityTraitStaticText
        self.firstActionButton?.accessibilityTraits = XcodeCompat.AccessibilityTraitButton
        self.secondActionButton?.accessibilityTraits = XcodeCompat.AccessibilityTraitButton
        
        self.titleLabel?.accessibilityLabel = ""
        self.subtitleLabel?.accessibilityLabel = ""
        self.firstActionButton?.accessibilityLabel = ""
        self.secondActionButton?.accessibilityLabel = ""
        
        self.titleLabel?.accessibilityHint = ""
        self.subtitleLabel?.accessibilityHint = ""
        self.firstActionButton?.accessibilityHint = ""
        self.secondActionButton?.accessibilityHint = ""
    }

    func applyDefaultValues() {
        self.theme = Themes.varejo
        
        if nil == title {
            self.title = ""
        }
        if nil == subtitle {
            self.subtitle = ""
        }
        if nil == titleFont {
            self.titleFont = UIFont.itauTextMediumFont()
        }
        if nil == subtitleFont {
            self.subtitleFont = UIFont.itauTextSmallFont()
        }
        if nil == firstActionButtonFont {
            self.firstActionButtonFont = UIFont.itauFontIcon(withSize: 24)
        }
        if nil == secondActionButtonFont {
            self.secondActionButtonFont = UIFont.itauFontIcon(withSize: 24)
        }
    }
    
    public func setAction(type: HeaderActionType, icon: String?) {
        if .header == type {
            tapRecognizer?.isEnabled = true
        } else if .firstAction == type {
            enableActionButton(button: self.firstActionButton, icon: icon)
        } else if .secondAction == type {
            enableActionButton(button: self.secondActionButton, icon: icon)
        }
    }
    
    public func removeAction(type: HeaderActionType) {
        if .header == type {
            tapRecognizer?.isEnabled = false
        } else if .firstAction == type {
            disableActionButton(button: self.firstActionButton)
        } else if .secondAction == type {
            disableActionButton(button: self.secondActionButton)
        }
    }
    
    func enableActionButton(button: UIButton?, icon: String?) {
        guard let button = button else { return }
        button.setTitle(icon, for: .normal)
        button.isEnabled = true
        button.isHidden = false
    }
    
    func disableActionButton(button: UIButton?) {
        guard let button = button else { return }
        button.isEnabled = false
        button.isHidden = true
    }

    func applyTheme() {
    }
    
    
    // MARK: - Actions
    
    /**
     * Handles tap over the component itself.
     */
    @IBAction func handleTap(_ sender: Any) {
        guard let enabled = self.tapRecognizer?.isEnabled, enabled == true else { return }
        self.delegate?.didTap(on: .header)
    }
    
    /**
     * Handles tap over the first action.
     */
    @IBAction func handleFirstActionTap() {
        guard let enabled = self.firstActionButton?.isEnabled, enabled == true else { return }
        self.delegate?.didTap(on: .firstAction)
    }

    /**
     * Handles tap over the second action.
     */
    @IBAction func handleSecondActionTap() {
        guard let enabled = self.secondActionButton?.isEnabled, enabled == true else { return }
        self.delegate?.didTap(on: .secondAction)
    }
    
}
