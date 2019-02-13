//
//  ReceiptDoneOnCell.swift
//  iOSUIComponentsCore-iOS
//
//  Created by victor.magpali on 21/01/19.
//  Copyright © 2019 inacioferrarini. All rights reserved.
//

import UIKit
import Reusable

final public class ReceiptDoneOnCell: UIView {
    
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    

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
     * Sets up the texts, fonts and text color
     */
    public func setup(with text: String, icon: String = "") {
        self.icon = icon
        self.timeText = text
        self.timeLabel.font = UIFont.itauTextSmallFont()
        self.timeLabel.textColor = .itauN60
        self.timeLabel.numberOfLines = 1
        self.iconLabel.font = UIFont.itauFontIcon(withSize: 24)
        self.iconLabel.textColor = .itauN60
        self.iconLabel.numberOfLines = 1
        self.separatorView.backgroundColor = .itauN30
    }
    
    // MARK: - Public Properties
    
    /**
     * Icon of the receipt done on cell
     *
     * @return String?
     */
    public var icon: String? {
        didSet {
            self.iconLabel.text = icon
            self.iconLabel.accessibilityValue = icon
        }
    }
    
    /**
     * Date of the receipt done on cell
     *
     * @return String?
     */
    public var timeText: String? {
        didSet {
            self.timeLabel.text = timeText
            self.timeLabel.accessibilityValue = timeText
        }
    }

}

extension ReceiptDoneOnCell: NibOwnerLoadable {}
