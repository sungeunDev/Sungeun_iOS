//
//  ProductsData.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 20/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import Foundation

struct ProductData: Decodable {
    var totalCount: Int
    var productList: Array<Product>
    
    private enum CodingKeys: String, CodingKey {
        case totalCount
        case productList = "product"
    }
}

struct Product: Decodable {
    let id: Int
    let name: String
    let thumbnail: String
    let description: ProductDescription
    let rate: Double
    
    init(from favorite: Favorite) {
        self.id = favorite.id
        self.name = favorite.name
        self.thumbnail = favorite.thumbnail
        self.rate = favorite.rate
        
        let description = ProductDescription(imagePath: favorite.imagePath, subject: favorite.subject, price: favorite.price)
        self.description = description
    }
}

struct ProductDescription: Decodable {
    let imagePath, subject: String
    let price: Int
}
