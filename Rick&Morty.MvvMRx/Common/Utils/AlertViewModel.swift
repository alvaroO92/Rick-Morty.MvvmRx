//
//  AlertErrorViewModel.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import UIKit

struct AlertViewModel {
    let title: String
    let message : String
}

protocol AlertView {
    func showAlert(with model: AlertViewModel)
}

extension AlertView where Self: UIViewController {
    
    func showAlert(with model: AlertViewModel) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert
        )
        alert.addAction(.init(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
}


