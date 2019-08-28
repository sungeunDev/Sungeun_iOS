//
//  NetworkService.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 20/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import Foundation
import Alamofire

struct RequestSize {
    var limit: Int = 0 // default
    var size: Int = 20 // default
}

struct NetworkRequest {
    var url: String
    var method: HTTPMethod = .get
    var parameters: Parameters?
    var encoding: ParameterEncoding = JSONEncoding.prettyPrinted
    var headers: HTTPHeaders? = nil
    
    init(url: String, parameters: Parameters? = nil) {
        self.url = url
        self.parameters = parameters
    }
    
    init(url: String,
         method: HTTPMethod,
         parameters: Parameters?,
         encoding: ParameterEncoding,
         headers: HTTPHeaders) {
        self.url = url
        self.method = method
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
    }
}

final class NetworkManager {
    static func requestAPIWithSetCookie(_ request: NetworkRequest,
                                        _ callback: @escaping (DataResponse<Any>) -> ()) {
        Alamofire.request(request.url,
                          method: request.method,
                          parameters: request.parameters,
                          encoding: request.encoding, headers: request.headers)
            .validate()
            .responseJSON(completionHandler: callback)
    }
}
