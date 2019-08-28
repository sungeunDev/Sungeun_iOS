//
//  SortingViewController.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 21/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import UIKit

struct SortSetting {
    // set default value
    var sortBy: SortBy = .enrollDate
    var orderBy: OrderBy = .ascending
}

enum SortBy: Int {
    case enrollDate
    case rate
    
    public var keyPath: String {
        return "\(self)"
    }
}

enum OrderBy: Int {
    case ascending
    case descending
    
    public var isAscending: Bool {
        return self == .ascending
    }
}


final class SortingViewController: UIViewController {

    @IBOutlet weak var sortBySegmentedControl: UISegmentedControl!
    @IBOutlet weak var orderBySegmentedControl: UISegmentedControl!
    
    var sortSetting = SortSetting()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissViewController)))
        sortBySegmentedControl.selectedSegmentIndex = sortSetting.sortBy.rawValue
        orderBySegmentedControl.selectedSegmentIndex = sortSetting.orderBy.rawValue
    }
    
    @IBAction func didClickedCancelButton(_ sender: UIButton) {
        dismissViewController()
    }
    
    @objc private func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didChangedSortByValue(_ sender: UISegmentedControl) {
        if let newSortBy = SortBy(rawValue: sender.selectedSegmentIndex) {
            sortSetting.sortBy = newSortBy
        }
    }
    
    @IBAction func didChangedOrderByValue(_ sender: UISegmentedControl) {
        if let newOrderBy = OrderBy(rawValue: sender.selectedSegmentIndex) {
            sortSetting.orderBy = newOrderBy
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        dismissViewController()
    }
}
