//
//  FavoritesViewController.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 20/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import UIKit
import RealmSwift
import Then

final class FavoritesViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var favsList: [Favorite] = [] {
        willSet {
            totalLabel.text = "총 상품수: \(newValue.count)개"
        }
    }
    var sortSetting = SortSetting() {
        willSet {
            let result = dbManager.getAllObject(of: Favorite.self)
            favsList = sortFavoriteData(result, by: newValue)
            tableView.reloadData()
        }
    }
    
    let refreshControl = UIRefreshControl()
    let dbManager = DBManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        setUp()
        reload()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reload()
    }
    
    private func sortFavoriteData(_ data: Results<Favorite>?, by sortSetting: SortSetting) -> [Favorite] {
        guard let data = data else { return [] }
        
        
        let sortedData = data.sorted(byKeyPath: sortSetting.sortBy.keyPath,
                                     ascending: sortSetting.orderBy.isAscending)
        return Array(sortedData)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? DetailsViewController,
            let product = sender as? Product {
            detailVC.product = product
        }
        
        if let sortingVC = segue.destination as? SortingViewController {
            sortingVC.sortSetting = self.sortSetting
        }
    }
    
    private func setUp() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(cell: ProductCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.tableFooterView = UIView()
        
        tableView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(reload), for: .valueChanged)
        
        totalLabel.font = R.font.notoSansCJKkrBold(size: 17)
    }
    
    @objc private func reload() {
        startAnimating()

        let result = dbManager.getAllObject(of: Favorite.self)
        
        favsList = sortFavoriteData(result, by: sortSetting)
        refreshControl.endRefreshing()
        stopAnimating()
        tableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        if let sortingVC = sender.source as? SortingViewController {
            self.sortSetting = sortingVC.sortSetting
        }
    }
}

// MARK: - UITableView
extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favsList.isEmpty ? 1 : favsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let favs = favsList
        if !favs.isEmpty {
            let cell = tableView.dequeue(ProductCell.self)
            let product = Product(from: favs[indexPath.row])
            cell.indexPath = indexPath
            cell.product = product
            cell.delegate = self
            return cell
        } else {
            return makeEmptyCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard !favsList.isEmpty else { return }
        let product = Product(from: favsList[indexPath.row])
        let identifier = R.segue.favoritesViewController.goToDetailVC
        performSegue(withIdentifier: identifier, sender: product)
    }
    
    private func makeEmptyCell() -> UITableViewCell {
        let emptyCell = UITableViewCell()
        let emptyInfoLabel = UILabel().then {
            $0.text = "즐겨찾는 숙소를 추가해 보세요! :)"
            $0.font = R.font.notoSansCJKkrRegular(size: 17)
            $0.textAlignment = .center
        }
        emptyCell.addSubview(emptyInfoLabel)
        emptyInfoLabel.snp.makeConstraints { (make) in
            make.width.equalTo(tableView.frame.width)
            make.height.equalTo(tableView.frame.height)
            make.edges.equalToSuperview()
        }
        emptyCell.selectionStyle = .none
        return emptyCell
    }
}

// MARK: - ProductCellDelegate
extension FavoritesViewController: ProductCellDelegate {
    func didClickedFavoriteButton(index: Int, product: Product) {
        
        favsList.remove(at: index)
        tableView.reloadData()
    }
}
