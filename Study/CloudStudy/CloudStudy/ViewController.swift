//
//  ViewController.swift
//  CloudStudy
//
//  Created by sungnni on 2018. 6. 26..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit
import CloudKit

class ViewController: UIViewController {

  let database = CKContainer.default().privateCloudDatabase
  var notes = [CKRecord]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    queryDatabase()
    saveToCloud(note: "third note")
  }

  
  func saveToCloud(note: String) {
    let newNote = CKRecord(recordType: "Note")
    newNote.setValue(note, forKey: "content")
    
    database.save(newNote) { (record, error) in
      print(error)
      guard record != nil else { return }
      print(record?.object(forKey: "content"))
      self.queryDatabase()
    }
  }
  
  
  func queryDatabase() {
    let query = CKQuery(recordType: "Note", predicate: NSPredicate(value: true))
    database.perform(query, inZoneWith: nil) { (records, error) in
      guard let records = records, error == nil else { return }
      self.notes = records
      
      for note in self.notes {
        print(note.object(forKey: "content") as! String)
      }
    }
  }


}

