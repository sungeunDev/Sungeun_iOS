//
//  DBManager.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 23/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import Foundation
import RealmSwift

class DBManager {
    
    let db: Realm
    
    init() {
        do {
            db = try Realm()
        } catch (let err) {
            print(err.localizedDescription)
            fatalError("Could not create realm instance")
        }
    }
    
    func getAllObject<E: Object>(of type: E.Type) -> Results<E> {
        return db.objects(type)
    }
    
    func getObject<E: Object, Key: Equatable>(of type: E.Type,
                                              keyId: Key) -> E? {
        return db.object(ofType: type, forPrimaryKey: keyId)
    }
    
    func save<T: Object>(_ data: T) {
        let data = data as T
        try! db.write {
            db.add(data)
        }
    }
    
    func delete<E: Object, key: Equatable>(realmData: E.Type, keyId: key) {
        if let object = db.object(ofType: E.self, forPrimaryKey: keyId) {
            try! db.write {
                db.delete(object)
            }
        }
    }
}
