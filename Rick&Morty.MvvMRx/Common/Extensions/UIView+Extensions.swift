//
//  DataManagerProtocol.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

extension UIView {
    func pinSuperView(with view: UIView, edges: UIEdgeInsets = .zero) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: -edges.top),
            view.leftAnchor.constraint(equalTo: leftAnchor, constant: -edges.left),
            view.rightAnchor.constraint(equalTo: rightAnchor, constant: -edges.right),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edges.bottom)
        ])
    }
    
    func pinSafeArea(with view: UIView, edges: UIEdgeInsets = .zero) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            safeArea.topAnchor.constraint(equalTo: topAnchor, constant: -edges.top),
            safeArea.leftAnchor.constraint(equalTo: leftAnchor, constant: -edges.left),
            safeArea.rightAnchor.constraint(equalTo: rightAnchor, constant: -edges.right),
            safeArea.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edges.bottom)
        ])
    }
}
