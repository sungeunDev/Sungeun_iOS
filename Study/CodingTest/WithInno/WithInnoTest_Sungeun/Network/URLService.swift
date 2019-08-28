//
//  URLService.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 25/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import Foundation

struct URLService {
    static let baseUrl = "https://withinnovation.co.kr"
    
    static func getUrl(of type: URLType) -> String {
        switch type {
        case .productsList(let page):
            return URLService.baseUrl + "/App/json/\(page).json"
        }
    }
}

enum URLType {
    case productsList(page: Int)
}
