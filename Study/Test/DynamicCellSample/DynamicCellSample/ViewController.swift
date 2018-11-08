//
//  ViewController.swift
//  DynamicCellSample
//
//  Created by Ari on 07/11/2018.
//  Copyright © 2018 ssungnni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionviewHeightConstraint: NSLayoutConstraint!
    
    let numOfCell = 5
    let text = "가\n나\n다\n라\n사\n마\n비"
    let colors: [UIColor] = [.red, .yellow, .green, .blue, .gray]
    var isExtandeds: [Bool] = Array(repeating: false, count: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self

        print(collectionView.contentSize.height)
    }


}


//MARK: - collectionview
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numOfCell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as! testCell
        cell.label.text = self.text
        cell.backgroundColor = colors[indexPath.item]
        cell.isExtanded = isExtandeds[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! testCell
        cell.isExtanded = !cell.isExtanded
        self.isExtandeds[indexPath.item] = cell.isExtanded
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        
        collectionviewHeightConstraint.constant = collectionView.contentSize.height
        print("----------------< thie: \(collectionView.contentSize.height) >----------------")
        collectionView.layoutIfNeeded()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if !self.isExtandeds[indexPath.item] {
            return CGSize(width: collectionView.frame.width, height: 50)
        } else {
            let boundingRect = (self.text as NSString).boundingRect(with: CGSize(width: collectionView.bounds.width, height: 1000),
                                                                    options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                                    attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15.0)],
                                                                    context: nil)
            let size = CGSize(width: collectionView.bounds.width, height: ceil(boundingRect.height))
            print("----------------< size.height: \(size.height) >----------------")
            return size
        }
    }
}


class testCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override var backgroundColor: UIColor? {
        didSet {
            originalColor = backgroundColor
        }
    }
    
    var originalColor: UIColor?
    var isExtanded: Bool = false {
        didSet {
            if isExtanded {
                originalColor = self.backgroundColor ?? .brown
                self.backgroundColor = .brown
                label.numberOfLines = 0
            } else {
                self.backgroundColor = originalColor
                label.numberOfLines = 2
            }
//            label.sizeToFit()
        }
    }
    
    
    
}
