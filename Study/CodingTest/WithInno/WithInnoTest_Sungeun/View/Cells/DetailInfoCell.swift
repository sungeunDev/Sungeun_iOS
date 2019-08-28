//
//  DetailInfoCell.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 25/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import UIKit

class DetailInfoCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var favoriteButton: FavoriteButton!
    
    var product: Product? {
        didSet {
            guard let product = product else { return }
            configureCell(by: product)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        nameLabel.font = R.font.notoSansCJKkrBold(size: 20)
        ratingLabel.font = R.font.notoSansCJKkrRegular(size: 14)
        
        let basicFont = R.font.notoSansCJKkrRegular(size: 15)
        priceLabel.font = basicFont
        subjectLabel.font = basicFont
    }
    
    private func configureCell(by product: Product) {
        favoriteButton.product = product
        favoriteButton.setIsFavorite(by: product)
        
        nameLabel.text = product.name
        ratingLabel.text = "\(product.rate)"
        
        let description = product.description
        subjectLabel.text = "상세정보:\n\(description.subject)"
        
        if let priceStr = description.price.decimalFormat {
            priceLabel.text = "가격: \(priceStr)원"
        }
    }
}


class ImageCell: UITableViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    
    public var imagePath: String! {
        willSet {
            guard let imagePath = newValue else { return }
            productImageView.setImageDownsamplingWithCrop(url: imagePath)
        }
    }
    
    override func awakeFromNib() {
        productImageView.contentMode = .scaleAspectFill
        selectionStyle = .none
    }
}
