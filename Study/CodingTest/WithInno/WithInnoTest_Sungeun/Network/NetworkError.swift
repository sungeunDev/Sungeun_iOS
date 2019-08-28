//
//  NetworkError.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 20/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case hasNoData
    case unknown
    
    public var errorDescription: String? {
        let key: String
        let comment: String
        
        switch self {
        case .hasNoData:
            key = "NO DATA"
            comment = "데이터가 없는 경우"
        case .unknown:
            key = "UNKNOWN"
            comment = "알 수 없는 에러"
        }
        
        return NSLocalizedString(key, comment: comment)
    }
}
