//
//  AppColors.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

extension UIColor {
    // color components value between 0 to 255
    public convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1.0) {
      self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
}

class AppColors : UIColor {
    static let primary: UIColor = UIColor(r: 30, g: 40, b: 47)
    static let secondary: UIColor = UIColor(r: 255, g: 255, b: 255)
}
