//
//  Book.swift
//  BookManager
//
//  Created by sungnni on 2018. 3. 26..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import Foundation

struct Book {
    var name: String
    var genre: String
    var author: String
    
    func bookPrint() {
        print("Name: \(name)")
        print("Genre: \(genre)")
        print("Author: \(author)")
    }
}
