//
//  API.swift
//  Rick&Morty.MvvMRx
//
//  Created by Alvaro on 23/01/2021.
//  Copyright © 2021 Alvaro Orti Moreno. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

typealias Parameters = ([String:Any])
typealias ParseURLCompletion = (urlRequest: URLRequest,parameters: Parameters, encoding: ParametersEncoding)

class API : NSObject {
    
    private var endPoint : EndpointAPI!
 
    init(endPoint : EndpointAPI) {
        self.endPoint = endPoint
    }
    
    func request<T: Codable>() -> Observable<T> {
        let request = try! endPoint.asURLRequest()
    
        return Observable<T>.create { (observer) in

            let request = AF.request(request).validate(statusCode: 200..<300).response(queue: .main) {  (response) in
                    switch response.result {
                    case .success(let data):
                        do {
                            self.debugResponse(request: request, data: data)
                            let decoder = JSONDecoder()
                            let decoded = try decoder.decode(T.self, from: data!)
                            observer.onNext(decoded)
                            observer.onCompleted()
                        } catch {
                            debugPrint(error.localizedDescription)
                        }
                    case .failure(let error):
                        guard let underlyingError = error.underlyingError else { return }
                        
                        if let urlError = underlyingError as? URLError {
                            if let code = RequestError.init(rawValue: urlError.code.rawValue) {
                                observer.onError(code)
                            } else {
                                observer.onError(urlError)
                            }
                        }
                    }
            }
            
            return Disposables.create {
                request.cancel()
            }
        }
    }
}

//--------------------------------------------------------
// MARK: Debug
//--------------------------------------------------------

extension API {
    
     private func debugResponse(request: URLRequest, data : Data? = nil, error: Error? = nil) {
         let title = (data != nil) ? "SUCCESS" : "FAILURE"
         debugPrint("------------------\(title)------------------")
         debugPrint("URL: ", request.urlRequest?.url?.absoluteString ?? "")
         debugPrint("HEADERS: ", request.urlRequest?.allHTTPHeaderFields ?? "")

         
         var result : Any {
             if data != nil {
                 print("RESULT:")
                 return convertDataWithCompletionHandler(data!) { (object, err) in
                     print(object!)
                 }
             } else {
                 return "ERROR: \(error!)"
             }
         }
         
         debugPrint(result)
     }
     
     
     // given raw JSON, return a usable Foundation object
     private func convertDataWithCompletionHandler(_ data: Data, completionHandlerForConvertData: (_ result: AnyObject?, _ error: NSError?) -> Void) {

         var parsedResult: AnyObject! = nil
         do {
             parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
         } catch {
             let userInfo = [NSLocalizedDescriptionKey : "Could not parse the data as JSON: '\(data)'"]
             completionHandlerForConvertData(nil, NSError(domain: "convertDataWithCompletionHandler", code: 1, userInfo: userInfo))
         }
         completionHandlerForConvertData(parsedResult, nil)
     }

}
