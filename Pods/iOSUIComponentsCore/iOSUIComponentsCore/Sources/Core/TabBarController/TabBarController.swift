//
//  TabBarController.swift
//  iOSSampleApp
//
//  Created by Diogo Autilio, Inácio Ferrarini on 27/11/18.
//  Copyright © 2018 com.itau.components.sample. All rights reserved.
//

import UIKit

// swiftlint:disable nesting
internal enum Layout {
    
    static let tabBarHeight: CGFloat = 56.0
    
    enum Title {
        static let verticalAnchor: CGFloat = -4.0
    }
    enum Image {
        enum Selected {
            static let topAnchor: CGFloat = 6.0
            static let bottomAnchor: CGFloat = -6.0
        }
        
        enum UnSelected {
            static let topAnchor: CGFloat = -2.0
            static let bottomAnchor: CGFloat = 2.5
        }
    }
}
// swiftlint:enable nesting

@IBDesignable
open class TabBarController: UITabBarController {
    
    @IBInspectable var defaultIndex: Int = 0
    fileprivate var previousItem: UITabBarItem?
    fileprivate var previousTitle: String?
    
    /**
     * Theme to be used by this component.
     */
    public var theme: Theme? {
        didSet {
            applyTheme()
        }
    }
    
    
    // MARK: - Initialization
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.theme = Themes.varejo
        selectedIndex = defaultIndex
    }
    
    func applyTheme() {
        guard let theme = self.theme?.tabBar else { return }
        
        self.tabBar.isTranslucent = false
        self.view.backgroundColor = UIColor.itauN30

        UITabBar.appearance().barTintColor = theme.background
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: theme.textColor,
                                                          .font: UIFont.itauBoldFont(withSize: 12)],
                                                         for: .normal)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: Layout.Title.verticalAnchor)
        
        if let items = self.tabBar.items, selectedIndex < items.count {
            let item = items[selectedIndex]
            setupTabBarItem(item)
        }
    }
    
    override open func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // iOS 9.x fail to layoutSubviews after UITabBar.sizeThatFits method
        guard #available(iOS 10.0, *) else {
            self.tabBar.frame = CGRect(x: self.tabBar.frame.minX,
                                       y: self.tabBar.frame.minY + self.tabBar.frame.height - Layout.tabBarHeight,
                                       width: self.tabBar.frame.width,
                                       height: Layout.tabBarHeight)
            return
        }
    }
    
    // MARK: - Override methods
    
    override open func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        setupTabBarItem(item)
    }
    
    override open var selectedIndex: Int {
        didSet {
            if let item = self.tabBar.items?[selectedIndex] {
                setupTabBarItem(item)
            }
        }
    }
    
    // MARK: - Internal methods
    
    func setupTabBarItem(_ item: UITabBarItem) {
        
        // Setup accesibility
        item.accessibilityLabel = item.title
        
        // Save previous state
        if let previousItem = self.previousItem, let previousTitle = self.previousTitle {
            previousItem.title = previousTitle
            previousItem.imageInsets = UIEdgeInsets(top: Layout.Image.UnSelected.topAnchor,
                                                    left: 0,
                                                    bottom: Layout.Image.UnSelected.bottomAnchor,
                                                    right: 0)
        }
        if let currentTitle = item.title {
            self.previousTitle = currentTitle
        }
        
        // Selected State
        item.title = nil
        item.imageInsets = UIEdgeInsets(top: Layout.Image.Selected.topAnchor,
                                        left: 0,
                                        bottom: Layout.Image.Selected.bottomAnchor,
                                        right: 0)
        item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: Layout.Title.verticalAnchor)
        self.previousItem = item
    }
    
}

extension UITabBar {
    
    static let height: CGFloat = Layout.tabBarHeight
    
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        guard let window = UIApplication.shared.keyWindow else {
            return super.sizeThatFits(size)
        }
        var sizeThatFits = super.sizeThatFits(size)
        if #available(iOS 11.0, *) {
            sizeThatFits.height = UITabBar.height + window.safeAreaInsets.bottom
        } else {
            sizeThatFits.height = UITabBar.height
        }
        return sizeThatFits
    }
    
}
