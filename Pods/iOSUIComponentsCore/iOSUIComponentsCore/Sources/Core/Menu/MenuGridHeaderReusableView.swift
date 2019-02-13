//
//  MenuGridHeaderReusableView.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Thiago Lioy, Inácio Ferrarini on 05/12/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import UIKit
import Reusable

public class MenuGridHeaderReusableView: UICollectionReusableView {

    @IBOutlet var headerLabel: UILabel?
    
    public static func height() -> CGFloat {
        return 130
    }
    
    func setup(with title: NSAttributedString) {
        self.setupUI()
        let titleAc = title.string
        headerLabel?.attributedText = title
        let newString = titleAc.replacingOccurrences(of: "\n", with: ", ")
        setupAccessibility(with: newString)
        headerLabel?.accessibilityLabel = newString
    }
    
    func setupAccessibility(with value: String) {
        headerLabel?.accessibilityLabel = value
    }
    
    func setupUI() {
        headerLabel?.font = UIFont.itauTitleLargeFont()
        headerLabel?.textColor = .itauN80
    }
    
}
