//
//  ViewController.swift
//  CalenderCollectionView
//
//  Created by 박성은 on 2018. 3. 5..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var yearNmonthLb: UILabel!
    
    var year = 2018
    var month = 2
    var startCellCount = 4
    var days = 28
    var lastCellCount = 32
    
    @IBAction func previousAction(_ sender: Any) {
        if month > 1 {
            month -= 1
        } else {
            month = 12
            year -= 1
        }
        yearNmonthLb.text = "\(year)년 \(month)월"
        dayCount()
        collectionView.reloadData()
    }
    
    @IBAction func nextAction(_ sender: Any) {
        if month < 12 {
            month += 1
        } else {
            month = 1
            year += 1
        }
        yearNmonthLb.text = "\(year)년 \(month)월"
        dayCount()
        collectionView.reloadData()
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func dayCount() {
        switch month {
        case 1, 3, 5, 7, 8, 10, 12:
            days = 31
        case 4, 6, 9, 11:
            days = 30
        case 2:
            days = 28
        default:
            print("error")
        }
        
        startCellCount += days % 7
        lastCellCount = startCellCount + days
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        } else {
            return lastCellCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0
        {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayOfWeek", for: indexPath) as! DayofWeekCell
            let dayList = ["Sun", "Mon", "Tue","Wed","Thu","Fri","Sat"]
            cell.dayofWeekLb.text = dayList[indexPath.item]
            return cell
        } else {
            let dateCell = collectionView.dequeueReusableCell(withReuseIdentifier: "date", for: indexPath) as! DateCell
            
            if indexPath.item < startCellCount {
                dateCell.dateLb.text = ""
                dateCell.backgroundColor = .white
            } else {
                dateCell.dateLb.text = String(indexPath.item + 1 - startCellCount)
            }
            return dateCell
        }
    }
    
    
    func test() {
        let cal = Calendar(identifier: .gregorian)
        
        let year = cal.component(.year, from: Date())
        let month = cal.component(.month, from: Date())
        let day = cal.component(.day, from: Date())
        let days = cal.dateComponents([.hour, .minute, .second], from: Date())
        
        print(year, month, day)
        print(days)
        
        let date = Date(timeIntervalSinceNow: 3600*9)
        print(date)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size.width/7
        return CGSize(width: size, height: size)
    }
    
    // should -> did 호출
    // should : 눌렀을 때, did : 누르고 뗐을때
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .bottom)
        test()
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    
    
}

