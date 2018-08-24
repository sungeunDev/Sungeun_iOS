//
//  DataService.swift
//  ZigZag_Test
//
//  Created by sungnni on 2018. 8. 2..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import Foundation

struct DataService { // class여야 한다.
  static func image(completion: (Result<ShopList>) -> Void) {
    let url = Bundle.main.url(forResource: "shop_list", withExtension: "json")!
    
    do {
      let data = try Data(contentsOf: url)
      let images = try JSONDecoder().decode(ShopList.self, from: data)
      let result = Result<ShopList>.success(images)
      completion(result)
    } catch {
      let result = Result<ShopList>.failure(error)
      completion(result)
    }
  }
}
