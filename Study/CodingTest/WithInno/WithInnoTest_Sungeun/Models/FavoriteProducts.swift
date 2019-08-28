//
//  FavoriteProducts.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 21/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import Foundation
import RealmSwift

class Favorite: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var enrollDate: Date = Date()
    
    @objc dynamic var name: String = ""
    @objc dynamic var thumbnail: String = ""
    @objc dynamic var rate: Double = 0
    @objc dynamic var imagePath: String = ""
    @objc dynamic var subject: String = ""
    @objc dynamic var price: Int = 0
    
    convenience init(from product: Product) {
        self.init()
        self.id = product.id
        self.enrollDate = Date()
        
        self.name = product.name
        self.thumbnail = product.thumbnail
        self.rate = product.rate
        self.imagePath = product.description.imagePath
        self.subject = product.description.subject
        self.price = product.description.price
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
