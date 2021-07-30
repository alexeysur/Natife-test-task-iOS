//
//  FeedViewController+Navigation.swift
//  LifeStories
//
//  Created by Alexey on 30.07.2021.
//

import UIKit

extension UINavigationBar {
    open override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 60)
    }
}
