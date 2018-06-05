//
//  ViewController.swift
//  RealmTest
//
//  Created by sungnni on 2018. 6. 5..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class ViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
//        addTodo(title: "todo1", duedate: Date())
//        addTodo(title: "todo2", duedate: Date())
//        addTodo(title: "todo3", duedate: Date())
//        addTodo(title: "todo4", duedate: Date())
        
        print(NSHomeDirectory())
        
        button.addTarget(self, action: #selector(addTodo(_:)), for: .touchUpInside)
    }

    @objc func addTodo(_ sender: UIButton) {
//    @objc func addTodo(title: String, duedate : Date) {

        let title = textField.text!
        let dueDate = Date()
        
        let todo = Todo()
        todo.title = title
        todo.dueDate = dueDate
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(todo)
        }
        
        print("success")
    }
    
    @IBAction private func readAction() {
        let realm = try! Realm()
        let todo = realm.objects(Todo.self)
        print(todo)
    }

}

class Todo : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var dueDate : Date!
}

