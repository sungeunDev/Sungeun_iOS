//
//  Post.swift
//  PostmanExample
//
//  Created by sungnni on 2018. 3. 27..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import Foundation

struct Post: Codable {
    let pk: Int
    
    let author: UserInfo?
    
    let images: [String]?
    let title: String
    let imgCover: String?
    let content: String?
    let createdDate: String?
    
    
    
    enum CodingKeys: String, CodingKey {
        case pk
        case author
        case images
        case title
        case imgCover = "img_cover"
        case content
        case createdDate = "created_date"
    }
}


//[
//    {
//        "pk": 8,
//        "author": {
//            "pk": 1,
//            "username": "lhy",
//            "first_name": "",
//            "last_name": "",
//            "email": "dev@lhy.kr"
//        },
//        "images": [],
//        "title": "Post Title",
//        "img_cover": null,
//        "content": "",
//        "created_date": "2018-03-26T20:25:20.075944+09:00"
//    },

