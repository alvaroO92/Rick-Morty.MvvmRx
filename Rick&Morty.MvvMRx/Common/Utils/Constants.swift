//
//  Constants.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import Foundation

struct Constants : RawRepresentable {
    private(set) var rawValue: String
}

extension Constants {

    enum Api {
        static let host = "https://rickandmortyapi.com/api/"
        static let headerAcceptType = ["Accept" : "application/json"]
        static let headerContentType = ["content-Type" : "application/json"]
    }
    
    enum Parameters {
        static let password = "password"
        static let email = "email"
    }
    
    enum App {
        static let navTitle = "Rick&Morty"
    }
}
