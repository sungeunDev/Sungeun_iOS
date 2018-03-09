//
//  ViewController.swift
//  GustureSample
//
//  Created by 박성은 on 2018. 3. 6..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

    class ViewController: UIViewController, UIGestureRecognizerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var tf: UITextField!
    var datepick: UIDatePicker!
    
    // gesture
    @IBOutlet var countLb: UILabel!
    @IBOutlet var pointLb: UILabel!
    
    @IBOutlet var swipeGesture: UIGestureRecognizer!
    @IBOutlet var longtapGesture: UIGestureRecognizer!
    @IBOutlet var rotationGesture: UIGestureRecognizer!
    
    @IBAction func swipe(_ sender: UIGestureRecognizer) {
    print("swipe")
    }
    
    @IBAction func rotation(_ sender: UIGestureRecognizer) {
        print("rotation")
    }
    
    @IBAction func longtap(_ sender: UIGestureRecognizer) {
        print("longtap")
        sender.view?.backgroundColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.datePickerMode = .dateAndTime
        datePicker.minuteInterval = 10
        datePicker.addTarget(self, action: #selector(datepickerChange(_:)), for: .valueChanged)

    }

    @objc func datepickerChange(_ sender: UIDatePicker) {
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd eee a HH:mm"
        let strDate = dateFormat.string(from: sender.date)
        tf.text = strDate
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        countLb.text = "\(touch.tapCount)"
        pointLb.text = "\(touch.location(in: touch.view))"
        return true
    }
    
    
    // picker
    // picker는 datasource, delegate가 있기 때문에 delegate를 통해서 뭘 선택했는지를 받아올 수 있음.
    @IBOutlet var date: UIPickerView!
    
    let list1 = ["A", "A","c","A","A","e","A"]
    let list2 = ["ㄱ", "ㄴ","c"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return list1.count
        } else {
            return list2.count
        }
    }
   
    func pickerView(
        _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int
        ) -> String? {
        
   
        if component == 0 {
            return list1[row]
        } else {
            return list2[row]
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(component, row)
    }
    
//     데이트 피커는 UIContol을 상속 받아서 event, selector를 통해서 무엇이 선택됐는지 알 수 있음. (value changed)
    @IBOutlet var datePicker: UIDatePicker!
   
}



