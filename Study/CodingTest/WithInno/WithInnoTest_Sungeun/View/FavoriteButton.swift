//
//  FavoriteButton.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 20/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import UIKit
import RealmSwift
import Then

class FavoriteButton: UIButton {

    // MARK: - UI
    private var favoriteIconImageView: UIImageView!
    private let iconSize = CGSize(width: 30, height: 30)
    private var imageViewTintColor: UIColor {
        let favoriteTintColor = UIColor.red
        let basicTintColor = UIColor.gray
        
        if isFavorite {
            return favoriteTintColor
        } else {
            return basicTintColor
        }
    }
    
    // MARK: - properties
    public var product: Product?
    public var isFavorite: Bool {
        didSet {
            favoriteIconImageView.tintColor = imageViewTintColor
        }
    }
    public var additionalAction: (() -> Void)?
    
    private let dbManager = DBManager()
    private var favoriteIds: [Int] {
        let favorites = Array(dbManager.getAllObject(of: Favorite.self))
        return favorites.map { $0.id }
    }
    
    
    // MARK: - init
    override init(frame: CGRect) {
        self.isFavorite = false
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.isFavorite = false
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    
    // MARK: - methods
    public func setIsFavorite(by product: Product) {
        let favorite = dbManager.getObject(of: Favorite.self, keyId: product.id)

        isFavorite = (favorite != nil)
    }
    
    private func setUp() {
        self.addTarget(self, action: #selector(clickFavoriteButton(_:)), for: .touchUpInside)
        self.setTitle(nil, for: .normal)
        
        favoriteIconImageView = UIImageView().then({
            $0.image = R.image.iconLike()?.withRenderingMode(.alwaysTemplate)
            $0.tintColor = imageViewTintColor
        })
        self.addSubview(favoriteIconImageView)
        favoriteIconImageView.snp.makeConstraints { (make) in
            make.width.equalTo(iconSize.width)
            make.height.equalTo(iconSize.height)
            make.center.equalToSuperview()
        }
    }
    
    @objc private func clickFavoriteButton(_ sender: FavoriteButton) {
        additionalAction?()
        
        guard let product = product else { return }
        if !favoriteIds.contains(product.id) {
            let newFavorite = Favorite(from: product)
            dbManager.save(newFavorite)
        } else {
            dbManager.delete(realmData: Favorite.self, keyId: product.id)
        }
        isFavorite = !isFavorite
    }
}
