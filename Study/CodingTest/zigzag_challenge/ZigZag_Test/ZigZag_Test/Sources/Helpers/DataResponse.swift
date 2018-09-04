//
//  DataResponse.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 2..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation

struct DataResponse<Value> {
  let data: Data?
  let result: Result<Value>
  
  var error: Error? {
    return result.error // result.value 로 처리해도 됐을것. 명확하지만 불필요함.
  }
  
  var value: Value? {
    return result.value
  }
}

enum Result<Value> {
  case success(Value)
  case failure(Error)
  
  var value: Value? {
    switch self {
    case .success(let value):
      return value
    case .failure:
      return nil
    }
  }
  
  var error: Error? {
    switch self {
    case .success:
      return nil
    case .failure(let error):
      return error
    }
  }
}
