//
//  MainViewController.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 20/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import UIKit
import Then
import SnapKit
import RealmSwift
import Toaster

extension Delay {
    public static let extremelyShort: TimeInterval = 0.3
}

final class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // header view
    @IBOutlet weak var totalProductCountLabel: UILabel!
    @IBOutlet weak var currentPageLabel: UILabel!
    private var currentPage: Int = 1 {
        willSet {
            currentPageLabel.text = "\(newValue)"
            requestAllProductsData(page: newValue)
        }
    }
    
    var allProductsData: ProductData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUp()
        
        navigationController?.isNavigationBarHidden = true
        requestAllProductsData(page: currentPage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailsViewController,
            let product = sender as? Product {
            
            detailVC.product = product
        }
    }
    
    private func setUp() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(cell: ProductCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        let basicFont = R.font.notoSansCJKkrBold(size: 17)
        totalProductCountLabel.font = basicFont
        currentPageLabel.font = basicFont
        currentPageLabel.text = "\(currentPage)"
    }
    
    private func requestAllProductsData(page: Int) {
        startAnimating()
        ProductsAPI.parseProducts(by: page) { [weak self] (response, error) in
            self?.stopAnimating()
            guard let ss = self else { return } // ss == strong self
            
            if let productsData = response, error == nil {
                ss.allProductsData = productsData
                
                DispatchQueue.main.async {
                    ss.totalProductCountLabel.text = "총 상품수: \(productsData.totalCount)개"
                    ss.tableView.reloadData()
                }
            } else {
                guard let error = error else { return }
                let errMsg: String
                switch error {
                case NetworkError.hasNoData:
                    ss.currentPage -= 1
                    errMsg = "마지막 페이지입니다."
                case NetworkError.unknown:
                    errMsg = "알 수 없는 에러! 다시 시도해 주세요."
                default:
                    errMsg = "다시 시도해 주세요."
                }
                Toast(text: errMsg, delay: 0, duration: Delay.extremelyShort).show()
            }
        }
    }
    
    // MARK: - Actions
    @IBAction func didClickedRightButton(_ sender: UIButton) {
        currentPage += 1
    }
    
    @IBAction func didClickedLeftButton(_ sender: UIButton) {
        if currentPage > 1 {
            currentPage -= 1
        } else {
            Toast(text: "첫 페이지입니다.", delay: 0, duration: Delay.extremelyShort).show()
        }
    }
}


// MARK: - UITableView
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allProductsData?.productList.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let allProductsData = allProductsData,
            !allProductsData.productList.isEmpty {
            let cell = tableView.dequeue(ProductCell.self)
            cell.product = allProductsData.productList[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let product = allProductsData?.productList[indexPath.row] else { return }
        let identifier = R.segue.mainViewController.goToDetailVC
        performSegue(withIdentifier: identifier, sender: product)
    }
}
