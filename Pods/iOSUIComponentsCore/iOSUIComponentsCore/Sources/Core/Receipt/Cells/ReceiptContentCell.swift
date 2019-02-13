//
//  ReceiptContentCellTableViewCell.swift
//  iOSUIComponentsCore-iOS
//
//  Created by victor.magpali on 14/01/19.
//  Copyright © 2019 inacioferrarini. All rights reserved.
//

import UIKit
import Reusable

public enum ReceiptContentCellType {
    case text
    case currency
}

public struct ReceiptContent {
    let title: String
    let body: String
    let contentType: ReceiptContentCellType
    
    public init(title: String, body: String, contentType: ReceiptContentCellType) {
        self.title = title
        self.body = body
        self.contentType = contentType
    }
}

final public class ReceiptContentCell: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

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
     * Sets up the texts, fonts and text color based on the cell type parameter
     */
    public func setup(with content: ReceiptContent) {
        self.type = content.contentType
        self.title = content.title
        self.body = content.body
        self.titleLabel.font = UIFont.itauTextSmallFont()
        self.titleLabel.textColor = .itauN60
        self.contentLabel.textColor = .itauN80
    }
    
    // MARK: - Public Properties
    
    /**
     * Title of the receipt content cell
     *
     * @return String?
     */
    public var title: String? {
        didSet {
            titleLabel?.text = title
            titleLabel?.accessibilityValue = title
        }
    }
    
    /**
     * Body of the receipt content cell
     *
     * @return String?
     */
    public var body: String? {
        didSet {
            contentLabel?.text = body
            contentLabel?.accessibilityValue = body
        }
    }
    
    /**
     * Type of the receipt content cell
     *
     * @return ReceiptContentCellType?
     */
    public var type: ReceiptContentCellType? {
        didSet {
            if let celltype = type {
                switch celltype {
                case .text:
                    self.contentLabel.font = UIFont.itauTextLargeFont()
                    self.contentLabel.numberOfLines = 0
                case .currency:
                    self.contentLabel.font = UIFont.itauNumberMediumFont()
                    self.contentLabel.numberOfLines = 1
                }
            }
        }
    }
    
}

extension ReceiptContentCell: NibOwnerLoadable {}
