//
//  ResponseError.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import Foundation

protocol ResponseError : Error {
    var localizedTitle: String { get }
    var localizedDescription: String { get }
}

enum RequestError : Int, ResponseError {
    case generic            = 0
    case badRequest         = 400
    case loginFailed        = 401
    case userDisabled       = 403
    case notFound           = 404
    case methodNotAllowed   = 405
    case serverError        = 500
    case noConnection       = -1009
    case timeOutError       = -1001
    
    var localizedTitle: String {
        switch self {
        case .generic: return "genericError"
        case .badRequest: return "BadRequest"
        case .loginFailed: return "loginFailed"
        case .userDisabled: return "userDisabled"
        case .notFound: return "notFound"
        case .methodNotAllowed: return "methodNotAllowed"
        case .serverError: return "serverError"
        case .noConnection: return "noConnection"
        case .timeOutError: return "timeOutError"
        }
    }
}

