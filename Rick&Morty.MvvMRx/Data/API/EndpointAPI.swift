//
//  EndpointAPI.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
import Alamofire

enum EndpointAPI {
   case getCharacters
}

extension EndpointAPI : BaseAPI {
   
    var host: String {
        Constants.Api.host
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "character"
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
        case .getCharacters:
            return [:]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getCharacters:
            return .get
        }
    }
    
    var task: EndpointTask {
        switch self {
        case .getCharacters:
            return .requestPlain
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url: URL! = URL(string: self.host + self.path)
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)

        headers.dictionary.forEach({urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)})
        
        switch self.task {
        case .requestPlain:
            break
        case let .requestParameters(parameters, encoding):
            switch encoding {
            case .URLEncoding:
                urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
            case .JSONEncoding:
                urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
            case .requestPlain:
                break
            }
        }
        return urlRequest
    }
}
