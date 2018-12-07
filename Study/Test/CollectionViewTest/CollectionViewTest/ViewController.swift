//
//  ViewController.swift
//  CollectionViewTest
//
//  Created by Ari on 30/11/2018.
//  Copyright © 2018 ssungnni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colelctionView: UICollectionView!
    
    var musicType = ["Blues", "Klasik Müzik", "Halk Müzikleri", "Hip-hop", "Caz", "Pop", "Rock", " Enstrümantal Müzik", "House", "Rap" , "Slow"]
    
    var isRight: [Bool]?

    
    let columnLayout = FlowLayout(
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colelctionView?.collectionViewLayout = columnLayout
        colelctionView?.contentInsetAdjustmentBehavior = .always
        
        isRight = Array(repeating: false, count: musicType.count)
    }


}


//MARK: - collection
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return musicType.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.textLabel.text = musicType[indexPath.item]
        cell.textLabel.font = UIFont.systemFont(ofSize: 20)
        cell.sizeToFit()
        
        if let isRight = isRight {
            if isRight[indexPath.item] {
                cell.backgroundColor = .yellow
            } else {
                cell.backgroundColor = .red
            }
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = musicType[indexPath.item]
        
        let font = UIFont.systemFont(ofSize: 20)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font]
        let attString = NSAttributedString(string: text, attributes: attributes)
        
        let size = attString.size()
        let padding = CGFloat(10)
        return CGSize(width: size.width + padding * 2, height: size.height + padding * 2)
    }
    
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectCell = collectionView.cellForItem(at: indexPath)
        selectCell?.backgroundColor = .white
        if checkData(input: musicType[indexPath.item], str: "Pop") {
            musicType.remove(at: indexPath.item)
            isRight?.remove(at: indexPath.item)
            
            collectionView.reloadData()
        } else {
            selectCell?.backgroundColor = .blue
            isRight?[indexPath.item] = true
        }
        
    }
    
    func checkData(input: String, str: String) -> Bool {
        if input == str { return true } else { return false }
    }
    
    
}


//MARK: - cell
class MyCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
}


class FlowLayout: UICollectionViewFlowLayout {
    
    required init(minimumInteritemSpacing: CGFloat = 0, minimumLineSpacing: CGFloat = 0, sectionInset: UIEdgeInsets = .zero) {
        super.init()
        
        estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
        sectionInsetReference = .fromSafeArea
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)!.map { $0.copy() as! UICollectionViewLayoutAttributes }
        guard scrollDirection == .vertical else { return layoutAttributes }
        
        // Filter attributes to compute only cell attributes
        let cellAttributes = layoutAttributes.filter({ $0.representedElementCategory == .cell })
        
        // Group cell attributes by row (cells with same vertical center) and loop on those groups
        for (_, attributes) in Dictionary(grouping: cellAttributes, by: { ($0.center.y / 10).rounded(.up) * 10 }) {
            // Set the initial left inset
            var leftInset = sectionInset.left
            
            // Loop on cells to adjust each cell's origin and prepare leftInset for the next cell
            for attribute in attributes {
                attribute.frame.origin.x = leftInset
                leftInset = attribute.frame.maxX + minimumInteritemSpacing
            }
        }
        
        return layoutAttributes
    }
    
}
