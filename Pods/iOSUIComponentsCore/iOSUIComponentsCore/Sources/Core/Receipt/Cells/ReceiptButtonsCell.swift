//
//  ReceiptActionButtons.swift
//  iOSUIComponentsCore-iOS
//
//  Created by victor.magpali on 29/01/19.
//  Copyright © 2019 inacioferrarini. All rights reserved.
//

import UIKit
import Reusable

public protocol ReceiptButtonsDelegate: class {
    func handleLeftAction()
    func handleRightAction()
}

public struct ReceiptButtonsConfiguration {
    var leftButtonTitle: String
    var rightButtonTitle: String
    weak var delegate: ReceiptButtonsDelegate?
    
    public init(leftButtonTitle: String, rightButtonTitle: String, delegate: ReceiptButtonsDelegate? = nil) {
        self.leftButtonTitle = leftButtonTitle
        self.rightButtonTitle = rightButtonTitle
        self.delegate = delegate
    }
}

final public class ReceiptButtonsCell: UIView {
    
    @IBOutlet weak var leftActionButton: UIButton!
    @IBOutlet weak var rightActionButton: UIButton!
    
    weak var delegate: ReceiptButtonsDelegate?
    
    //MARK: - Initializers
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadNibContent()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNibContent()
    }
    
    // MARK: - Public Functions
    /**
     * Sets up the texts, delegate
     */
    public func setup(with configuration: ReceiptButtonsConfiguration) {
        self.delegate = configuration.delegate
        setupLeftButton(with: configuration.leftButtonTitle)
        setupRightButton(with: configuration.rightButtonTitle)
    }
    
    
    // MARK: - Public Properties
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
    
    @IBAction func didTapLeftButton(_ sender: Any) {
        self.delegate?.handleLeftAction()
    }
    
    @IBAction func didTapRightButton(_ sender: Any) {
        self.delegate?.handleRightAction()
    }
    
    //MARK: Private functions
    private func setupLeftButton(with title: String) {
        leftActionButton.setTitle(title, for: .normal)
        leftActionButton.isAccessibilityElement = true
        leftActionButton.accessibilityTraits = XcodeCompat.AccessibilityTraitButton
        leftActionButtonFont = .itauTitleMediumFont()
        leftActionButtonTitleColor = .itauBlue
    }
    
    private func setupRightButton(with title: String) {
        rightActionButton.setTitle(title, for: .normal)
        rightActionButton.isAccessibilityElement = true
        rightActionButton.accessibilityTraits = XcodeCompat.AccessibilityTraitButton
        rightActionButtonFont = .itauTitleMediumFont()
        rightActionButtonTitleColor = .itauBlue
    }

}

extension ReceiptButtonsCell:  NibOwnerLoadable {}
