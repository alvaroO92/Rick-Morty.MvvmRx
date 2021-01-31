//
//  UIViewController+Extensions.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

extension UIViewController {
  
    func addNavigationBar(title: String, titleColor: UIColor, titleFont: UIFont, backgroundColor: UIColor, leftBarButtonItem: UIBarButtonItem? = nil, rightBarButtonItem: UIBarButtonItem? = nil) {
        self.changeNavigationBarColor(backgroundColor)
        self.navigationItem.title = title
        self.navigationItem.setHidesBackButton(true, animated: true)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor,
            NSAttributedString.Key.font: titleFont]
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func addNavigationBar(titleView: UIView, backgroundColor: UIColor, letfBarButtonItem: UIBarButtonItem? = nil, rightBarButtonItem: UIBarButtonItem? = nil) {
        self.changeNavigationBarColor(backgroundColor)
        self.navigationItem.setHidesBackButton(true, animated: true)
        let lefBarButton = UIBarButtonItem(customView: titleView)
        self.navigationItem.leftBarButtonItem = lefBarButton
    }
}

private extension UIViewController {
    func changeNavigationBarColor(_ color : UIColor) {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.barTintColor = color
        navigationBar?.isTranslucent = false
        navigationBar?.setBackgroundImage(UIImage(), for:.default)
        navigationBar?.shadowImage = UIImage()
        navigationBar?.layoutIfNeeded()
    }
}
