//
//  DetailsViewController.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 20/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import UIKit

final class DetailsViewController: UITableViewController {

    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
    }
}

// MARK: - UITableView
extension DetailsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard product != nil else { return 0 }
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let product = product else { return UITableViewCell() }
        switch indexPath.row {
        case 0: //return makeEmptyCell()
            let cell = tableView.dequeue(ImageCell.self)
            cell.imagePath = product.description.imagePath
            return cell
        case 1:
            let cell = tableView.dequeue(DetailInfoCell.self)
            cell.product = product
            return cell
        default: return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
