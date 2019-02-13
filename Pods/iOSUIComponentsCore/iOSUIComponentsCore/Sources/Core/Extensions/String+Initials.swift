//
//  String+Initials.swift
//  iOSUIComponentsCore-iOS
//
//  Created by Inácio Ferrarini on 25/10/18.
//  Copyright © 2018 inacioferrarini. All rights reserved.
//

import Foundation

public extension String {
    
    func initials() -> String {
        let firstChar = self.prefix(1)
        if self.count == 1 {
            return String(firstChar)
        }
        var secondChar = ""
        if self.contains(" "), let lastWord = self.components(separatedBy: " ").last {
            secondChar = String(lastWord.prefix(1))
        } else {
            secondChar = String(self.prefix(2).suffix(1))
        }
        return String(firstChar + secondChar).uppercased()
    }
    
}
