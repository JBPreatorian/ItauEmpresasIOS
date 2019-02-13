//
//  ReceiptView.swift
//  iOSUIComponentsCore-iOS
//
//  Created by victor.magpali on 22/01/19.
//  Copyright © 2019 inacioferrarini. All rights reserved.
//

import UIKit
import Reusable


final public class ReceiptView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var footerStackView: UIStackView!
    
    //MARK: - Initializers
    required convenience init(title: String, content: [ReceiptContent], buttonConfiguration: ReceiptButtonsConfiguration? = nil, doneOnText: String? = nil, frame: CGRect = .zero) {
        self.init(frame: frame)
        self.setupTitle(with: title)
            .setupContent(with: content)
            .setupBottomComponents(buttonConfiguration: buttonConfiguration, doneOnText: doneOnText)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadNibContent()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNibContent()
    }
    
    //MARK: - Public Variables
    
    /**
     * Title of the receipt card
     *
     * @return String?
     */
    public var title: String?  {
        didSet {
            titleLabel?.text = title
            titleLabel?.accessibilityValue = title
        }
    }
    
    /**
     * Array of receipt contents used to populate the receipt content cells
     *
     * @return [ReceiptContent]?
     */
    public var content: [ReceiptContent]?
    
    /**
     * Cell containing the left action button and right action button
     *
     * @return ReceiptButtonsCell?
     */
    public var receiptButtonsCell: ReceiptButtonsCell?
    
    /**
     * Cell containing the time stamp
     *
     * @return ReceiptDoneOnCell?
     */
    public var receiptDoneOnCell: ReceiptDoneOnCell?
    
    //MARK: - Public Functions
    public func setup(title: String, content: [ReceiptContent], buttonConfiguration: ReceiptButtonsConfiguration? = nil, doneOnText: String? = nil) {
        self.setupTitle(with: title)
            .setupContent(with: content)
            .setupBottomComponents(buttonConfiguration: buttonConfiguration, doneOnText: doneOnText)
    }
    
    @discardableResult
    public func setupTitle(with title: String) -> ReceiptView {
        self.title = title
        self.titleLabel.textColor = .itauN80
        self.titleLabel.font = .itauTitleLargeFont()
        return self
    }
    
    @discardableResult
    public func setupContent(with content: [ReceiptContent]) -> ReceiptView {
        self.content = content
        contentStackView.removeAllArrangedSubviews()
        for object in content {
            let contentCell = ReceiptContentCell(frame: .zero)
            contentCell.setup(with: object)
            contentStackView.addArrangedSubview(contentCell)
        }
        return self
    }
    
    @discardableResult
    public func setupBottomComponents(buttonConfiguration: ReceiptButtonsConfiguration? = nil, doneOnText: String? = nil) -> ReceiptView{
        footerStackView.removeAllArrangedSubviews()
        if let configuration = buttonConfiguration{
            self.setupButtons(with: configuration)
        }
        if let doneOn = doneOnText {
            self.setupDoneOn(with: doneOn)
        }
        return self
    }
    
    
    //MARK: - Private functions
    
    @discardableResult
    private func setupButtons(with configuration: ReceiptButtonsConfiguration) -> ReceiptView {
        let buttonsCell = ReceiptButtonsCell(frame: .zero)
        buttonsCell.setup(with: configuration)
        footerStackView.addArrangedSubview(buttonsCell)
        self.receiptButtonsCell = buttonsCell
        return self
    }
    
    @discardableResult
    private func setupDoneOn(with text: String) -> ReceiptView {
        let doneOnCell = ReceiptDoneOnCell(frame: .zero)
        doneOnCell.setup(with: text)
        footerStackView.addArrangedSubview(doneOnCell)
        self.receiptDoneOnCell = doneOnCell
        return self
    }
    
}

extension ReceiptView: NibOwnerLoadable {}
