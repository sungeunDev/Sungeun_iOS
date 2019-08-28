//
//  ProductCell.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 20/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import UIKit

protocol ProductCellDelegate {
    func didClickedFavoriteButton(index: Int, product: Product)
}

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var favoriteButton: FavoriteButton!
    
    var indexPath: IndexPath?
    var delegate: ProductCellDelegate? {
        didSet {
            if let delegate = delegate {
                favoriteButton.additionalAction = {
                    delegate.didClickedFavoriteButton(index: self.indexPath!.row,
                                                      product: self.product!)
                }
            }
        }
    }
    public var product: Product? {
        didSet {
            guard let product = product else { return }
            favoriteButton.setIsFavorite(by: product)
            configureCell(by: product)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
     
        setUp()
    }
    
    private func setUp() {
        selectionStyle = .none
        productImageView.contentMode = .scaleAspectFill
        
        titleLabel.font = R.font.notoSansCJKkrBold(size: 20)
        ratingLabel.font = R.font.notoSansCJKkrRegular(size: 14)
    }
    
    private func configureCell(by product: Product) {
        productImageView.setImageDownsamplingWithCrop(url: product.thumbnail)
        titleLabel.text = product.name
        ratingLabel.text = "\(product.rate)"
        
        favoriteButton.product = product
    }
}
