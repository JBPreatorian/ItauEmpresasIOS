//
//  CardViewModel.swift
//  FlexiblePageControl
//
//  Created by Inácio Ferrarini on 26/12/18.
//

import Foundation

public struct CardViewModel {
    
    public var imageBase64Content: String?
    public var title: String?
    public var text: String?
    public var actions: [String]?
    public var imageAction: Bool = false
    public weak var delegate: CardViewDelegate?

    public init(imageBase64Content: String? = nil,
                title: String? = nil,
                text: String? = nil,
                actions: [String]? = nil,
                imageAction: Bool = false) {
        self.imageBase64Content = imageBase64Content
        self.title = title
        self.text = text
        self.actions = actions
        self.imageAction = imageAction
    }
    
}
