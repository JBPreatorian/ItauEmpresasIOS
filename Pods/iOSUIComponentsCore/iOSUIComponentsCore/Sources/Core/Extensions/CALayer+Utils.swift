//
//  CALayer+Utils.swift
//  BussinessPFTransactions
//
//  Created by Diogo Autilio on 04/12/2018.
//  Copyright (c) 2018 Diogo Autilio. All rights reserved.
//

import UIKit

internal extension CALayer {
    
    func addShadow() {
        self.shadowOffset = CGSize(width: 0, height: 1)
        self.shadowOpacity = 0.2
        self.shadowRadius = 1
        self.shadowColor = UIColor.black.cgColor
        self.masksToBounds = false
        
        if cornerRadius != 0 {
            addShadowWithRoundedCorners()
        }
    }
    
    func roundCorners(radius: CGFloat) {
        self.cornerRadius = radius
        
        if shadowOpacity != 0 {
            addShadowWithRoundedCorners()
        }
    }
    
    private func addShadowWithRoundedCorners() {
        if let contents = self.contents {
            
            let customLayerName = "customLayer"
            
            masksToBounds = false
            sublayers?.filter { $0.frame.equalTo(self.bounds) }
                .forEach { $0.roundCorners(radius: self.cornerRadius) }
            
            self.contents = nil
            
            if let sublayer = sublayers?.first, sublayer.name == customLayerName {
                sublayer.removeFromSuperlayer()
            }
            
            let contentLayer = CALayer()
            contentLayer.name = customLayerName
            contentLayer.contents = contents
            contentLayer.frame = bounds
            contentLayer.cornerRadius = cornerRadius
            contentLayer.masksToBounds = true
            
            insertSublayer(contentLayer, at: 0)
        }
    }
}

