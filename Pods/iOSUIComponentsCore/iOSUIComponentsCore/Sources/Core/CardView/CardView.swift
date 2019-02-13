//
//  CardView.swift
//  iOSUIComponentsCore-iOS
//
//  Created by inacio.ferrarini on 07/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit
import Reusable

public enum CardViewActionType {
    case image
    case firstAction
    case secondAction
}

public protocol CardViewDelegate: class {
    func didTap(on card: CardView, action: CardViewActionType)
}

public class CardView: UIView {
    
    // MARK: - Properties
    
    @IBOutlet weak var cardImageView: UIImageView?
    @IBOutlet weak var imageActionButton: UIButton?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var textLabel: UILabel?
    @IBOutlet weak var buttonContainerView: UIView?
    @IBOutlet weak var leftActionButton: UIButton?
    var rightActionConstraint: NSLayoutConstraint?
    @IBOutlet weak var rightActionButton: UIButton?
    public weak var delegate: CardViewDelegate?
    
    // MARK: - Public Properties
    
    /**
     * Theme to be used by this component.
     */
    public var theme: Theme? {
        didSet {
            applyTheme()
        }
    }
    
    
    // MARK: - Public Properties
    
    public var imageBase64Content: String? {
        didSet {
            if let base64EncodedString = imageBase64Content,
                let dataDecoded : Data = Data(base64Encoded: base64EncodedString, options: .ignoreUnknownCharacters) {
                let decodedimage = UIImage(data: dataDecoded)
                self.cardImageView?.image = decodedimage
            }
        }
    }
    
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
    @IBInspectable public var text: String? {
        didSet {
            textLabel?.text = text
            textLabel?.accessibilityValue = text
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
     * Color to be used to render text
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

    /**
     * Fonts to be used in the title
     *
     * @defaults to
     *
     * @return UIFont?
     */
    @IBInspectable public var titleFont: UIFont? {
        didSet {
            titleLabel?.font = titleFont
        }
    }
    
    /**
     * Fonts to be used in the text
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
     * Accessibility Value for left action button
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var leftActionButtonAccessibilityValue: String? {
        didSet {
            leftActionButton?.accessibilityValue = leftActionButtonAccessibilityValue
        }
    }
    
    /**
     * Accessibility Value for right action button
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var rightActionButtonAccessibilityValue: String? {
        didSet {
            rightActionButton?.accessibilityValue = rightActionButtonAccessibilityValue
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
    
    /**
     * Accessibility Hint for right action button
     *
     * @defaults to
     *
     * @return String?
     */
    @IBInspectable public var rightActionButtonAccessibilityHint: String? {
        didSet {
            rightActionButton?.accessibilityHint = rightActionButtonAccessibilityHint
        }
    }
    
    /**
     * Color to be used to render first action button title
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
     * Color to be used to render second action button title
     *
     * @defaults to
     *
     * @return UIColor?
     */
    @IBInspectable public var rightActionButtonTitleColor: UIColor? {
        didSet {
            rightActionButton?.setTitleColor(rightActionButtonTitleColor, for: .normal)
        }
    }
    
    /**
     * Font to be used to render second action button title
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
    
    /**
     * Font to be used to render second action button title
     *
     * @defaults to
     *
     * @return UIFont?
     */
    @IBInspectable public var rightActionButtonFont: UIFont? {
        didSet {
            rightActionButton?.titleLabel?.font = rightActionButtonFont
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
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    public func setup(with model: CardViewModel) {
        self.imageBase64Content = model.imageBase64Content
        self.title = model.title
        self.text = model.text

        removeAction(type: .image)
        removeAction(type: .firstAction)
        removeAction(type: .secondAction)
        
        if let actions = model.actions, actions.count > 0 {
            if let firstAction = actions.first {
                setAction(type: .firstAction, title: firstAction)
            }
            if actions.count > 1 {
                let secondAction = actions[1]
                setAction(type: .secondAction, title: secondAction)
            }
        }
        
        if model.imageAction {
            setAction(type: .image, title: "")
        }
        
        self.delegate = model.delegate
    }
    
    func setupUI() {
        self.setupAccessibility()
        self.applyDefaultValues()
        if let rightActionButton = self.rightActionButton, let leftActionButton = self.leftActionButton {
            self.rightActionConstraint = NSLayoutConstraint.init(item: rightActionButton, attribute: .leading, relatedBy: .equal, toItem: leftActionButton, attribute: .trailing, multiplier: 1, constant: 16)
        }
    }

    func setupAccessibility() {
        self.isAccessibilityElement = true
        self.titleLabel?.isAccessibilityElement = true
        self.textLabel?.isAccessibilityElement = true
        self.leftActionButton?.isAccessibilityElement = true
        self.rightActionButton?.isAccessibilityElement = true
        
        self.accessibilityTraits = XcodeCompat.AccessibilityTraitHeader
        self.titleLabel?.accessibilityTraits = XcodeCompat.AccessibilityTraitStaticText
        self.textLabel?.accessibilityTraits = XcodeCompat.AccessibilityTraitStaticText
        self.leftActionButton?.accessibilityTraits = XcodeCompat.AccessibilityTraitButton
        self.rightActionButton?.accessibilityTraits = XcodeCompat.AccessibilityTraitButton
        
        self.titleLabel?.accessibilityLabel = ""
        self.textLabel?.accessibilityLabel = ""
        self.leftActionButton?.accessibilityLabel = ""
        self.rightActionButton?.accessibilityLabel = ""
        
        self.titleLabel?.accessibilityHint = ""
        self.textLabel?.accessibilityHint = ""
        self.leftActionButton?.accessibilityHint = ""
        self.rightActionButton?.accessibilityHint = ""
    }
    
    func applyDefaultValues() {
        self.theme = Themes.varejo
        if nil == title {
            self.title = ""
        }
        if nil == text {
            self.text = ""
        }
        if nil == titleFont {
            self.titleFont = UIFont.itauTitleMediumFont()
        }
        if nil == textFont {
            self.textFont = UIFont.itauTextSmallFont()
        }
        if nil == leftActionButtonFont {
            self.leftActionButtonFont = UIFont.itauTitleMediumFont()
        }
        if nil == rightActionButtonFont {
            self.rightActionButtonFont = UIFont.itauTitleMediumFont()
        }
        removeAction(type: .image)
        removeAction(type: .firstAction)
        removeAction(type: .secondAction)
    }

    public func setAction(type: CardViewActionType, title: String?) {
        if .image == type {
            enableActionButton(button: self.imageActionButton, text: "")
        } else if .firstAction == type {
            self.rightActionConstraint?.isActive = false
            enableActionButton(button: self.leftActionButton, text: title)
        } else if .secondAction == type {
            self.rightActionConstraint?.isActive = true
            enableActionButton(button: self.rightActionButton, text: title)
        }
    }

    public func removeAction(type: CardViewActionType) {
        if .image == type {
            disableActionButton(button: self.imageActionButton)
        } else if .firstAction == type {
            self.rightActionConstraint?.isActive = false
            disableActionButton(button: self.leftActionButton)
        } else if .secondAction == type {
            self.rightActionConstraint?.isActive = false
            disableActionButton(button: self.rightActionButton)
        }
    }
    
    func enableActionButton(button: UIButton?, text: String?) {
        guard let button = button else { return }
        button.setTitle(text, for: .normal)
        button.isEnabled = true
        button.isHidden = false
    }
    
    func disableActionButton(button: UIButton?) {
        guard let button = button else { return }
        button.isEnabled = false
        button.isHidden = true
    }

    func applyTheme() {
        self.layer.addShadow()
        self.layer.roundCorners(radius: 4)
        self.cardImageView?.layer.roundCorners(radius: 4)
        self.cardImageView?.clipsToBounds = true

        guard let theme = self.theme?.cardView else { return }
        
        titleFont = UIFont.itauTitleMediumFont()
        titleColor = theme.titleColor

        textFont = UIFont.itauTextSmallFont()
        textColor = theme.textColor

        leftActionButtonTitleColor = theme.actionColor
        leftActionButtonFont = UIFont.itauTitleMediumFont()

        rightActionButtonTitleColor = theme.actionColor
        rightActionButtonFont = UIFont.itauTitleMediumFont()
    }

}

extension CardView {
    
    // MARK: - Actions
    
    /**
     * Handles tap over the component itself.
     */
    @IBAction func imageTapped() {
        guard let enabled = self.imageActionButton?.isEnabled, enabled == true else { return }
        self.delegate?.didTap(on: self, action: .image)
    }
    
    /**
     * Handles tap over the left action.
     */
    @IBAction func handleLeftActionTap() {
        guard let enabled = self.leftActionButton?.isEnabled, enabled == true else { return }
        self.delegate?.didTap(on: self, action: .firstAction)
    }
    
    /**
     * Handles tap over the right action.
     */
    @IBAction func handleRightActionTap() {
        guard let enabled = self.rightActionButton?.isEnabled, enabled == true else { return }
        self.delegate?.didTap(on: self, action: .secondAction)
    }
    
}

extension CardView: NibOwnerLoadable {}
