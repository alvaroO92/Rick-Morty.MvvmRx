//
//  BaseAPI.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import Alamofire
import Foundation

protocol BaseAPI : URLRequestConvertible {
    var host: String { get }
    var path: String { get }
    var headers: HTTPHeaders { get }
    var method: HTTPMethod { get }
    var task: EndpointTask { get }
}

enum EndpointTask {
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParametersEncoding)
}

enum ParametersEncoding {
    case URLEncoding
    case JSONEncoding
    case requestPlain
}
