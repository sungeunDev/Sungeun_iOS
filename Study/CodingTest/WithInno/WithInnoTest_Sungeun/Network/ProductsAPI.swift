//
//  ProductsAPI.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 20/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import Foundation
import SwiftyJSON

final class ProductsAPI {
    static public func parseProducts(by page: Int, completion: @escaping ((ProductData?, Error?) -> Void)) {
        
        let url = URLService.getUrl(of: .productsList(page: page))
        let request = NetworkRequest(url: url)
        
        NetworkManager.requestAPIWithSetCookie(request) { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let code = json["code"].intValue
                
                switch code {
                case 200:
                    let data = json["data"]
                    do {
                        let productData = try ProductData.decode(from: data)
                        completion(productData, nil)
                    } catch(let err) {
                        completion(nil, err)
                    }
                case 400:
                    completion(nil, NetworkError.hasNoData)
                default: completion(nil, NetworkError.unknown)
                }
                completion(nil, nil)
            case .failure(let err):
                completion(nil, err)
            }
        }
    }
}
