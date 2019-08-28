//
//  Helper.swift
//  WithInnoTest_Sungeun
//
//  Created by Sungeun Park on 20/08/2019.
//  Copyright © 2019 Sungeun Park. All rights reserved.
//

import SwiftyJSON
import Kingfisher
import NVActivityIndicatorView

// MARK: - set protocol
protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: Identifiable, NVActivityIndicatorViewable { }
extension UITableViewCell: Identifiable { }


// MARK: - extension
extension Decodable {
    static func decode(from json: JSON, decoder: JSONDecoder = JSONDecoder()) throws -> Self {
        return try decoder.decode(self, from: json.rawData())
    }
}

extension UITableView {
    
    func register<Cell>(cell: Cell.Type) where Cell: UITableViewCell {
        let reuseIdentifier = cell.identifier
        register(UINib(nibName: reuseIdentifier, bundle: nil),
                 forCellReuseIdentifier: reuseIdentifier)
    }
    
    func dequeue<Cell>(_ reusableCell: Cell.Type) -> Cell where Cell: UITableViewCell {
        guard let cell = dequeueReusableCell(
            withIdentifier: reusableCell.identifier
            ) as? Cell else { fatalError("Could not find cell with identifier") }
        return cell
    }
}

extension UIImageView {
    func setImageDownsamplingWithCrop(url: String) {
        
        let processor = DownsamplingImageProcessor(size: self.frame.size)
            >> CroppingImageProcessor(size: self.frame.size)
        
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with: URL(string: url),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.3)),
                .cacheOriginalImage
            ])
    }
}

extension Int {
    var decimalFormat: String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self))
    }
}
