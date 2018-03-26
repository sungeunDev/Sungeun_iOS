//
//  item.swift
//  WAWET
//
//  Created by sungnni on 2018. 3. 24..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import Foundation




struct Recipe: Decodable {
    enum CodingKeys: String, CodingKey {
        case text
        case image
    }
    
    let text: String?
    var image: String?
}
