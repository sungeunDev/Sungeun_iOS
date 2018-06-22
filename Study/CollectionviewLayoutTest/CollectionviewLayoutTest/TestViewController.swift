//
//  TestViewController.swift
//  CollectionviewLayoutTest
//
//  Created by sungnni on 2018. 6. 12..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UICollectionViewDataSource {
    
    var arr: [String] = (0...100).map { return "\($0)" }
    
    lazy var collectionView: UICollectionView =  {
        let layout = UICollectionViewFlowLayout()
        let cv: UICollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        cv.register(Cell.self, forCellWithReuseIdentifier: Cell.id)
        layout.itemSize = CGSize(width: view.bounds.width/3.5, height: 100)
        cv.dataSource = self
        cv.addGestureRecognizer(longPressGesture)
        return cv
    }()
    
    lazy var longPressGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
    
    private var movingCell: MovingCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = collectionView
    }
    
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
        
        var cell: (UICollectionViewCell?, IndexPath?) {
            guard let indexPath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)),
                let cell = collectionView.cellForItem(at: indexPath) else { return (nil, nil) }
            return (cell, indexPath)
        }
        
        switch(gesture.state) {
            
        case .began:
            movingCell = MovingCell(cell: cell.0, originalLocation: cell.0?.center, indexPath: cell.1)
            break
        case .changed:
            
            /// Make sure moving cell floats above its siblings.
            movingCell?.cell.layer.zPosition = 100
            movingCell?.cell.center = gesture.location(in: gesture.view!)
            
            break
        case .ended:
            
            swapMovingCellWith(cell: cell.0, at: cell.1)
            movingCell = nil
        default:
            movingCell?.reset()
            movingCell = nil
        }
    }
    
    func swapMovingCellWith(cell: UICollectionViewCell?, at indexPath: IndexPath?) {
        guard let cell = cell, let moving = movingCell else {
            movingCell?.reset()
            return
        }
        
        // update data source
        arr.swapAt(moving.indexPath.row, indexPath!.row)
        
        // swap cells
        animate(moving: moving.cell, to: cell)
    }
    
    func animate(moving movingCell: UICollectionViewCell, to cell: UICollectionViewCell) {
        longPressGesture.isEnabled = false
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.allowUserInteraction, animations: {
            movingCell.center = cell.center
            cell.center = movingCell.center
        }) { _ in
            self.collectionView.reloadData()
            self.longPressGesture.isEnabled = true
        }
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: Cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.id, for: indexPath) as! Cell
        cell.titleLable.text = arr[indexPath.row]
        return cell
    }
    
    
    
    
    private struct MovingCell {
        let cell: UICollectionViewCell
        let originalLocation: CGPoint
        let indexPath: IndexPath
        
        init?(cell: UICollectionViewCell?, originalLocation: CGPoint?, indexPath: IndexPath?) {
            guard cell != nil, originalLocation != nil, indexPath != nil else { return nil }
            self.cell = cell!
            self.originalLocation = originalLocation!
            self.indexPath = indexPath!
        }
        
        func reset() {
            cell.center = originalLocation
        }
    }
    
    
    
    
    final class Cell: UICollectionViewCell {
        static let id: String = "CellId"
        
        lazy var titleLable: UILabel = UILabel(frame: CGRect(x: 0, y: 20, width: self.bounds.width, height: 30))
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(titleLable)
            titleLable.backgroundColor = .green
            backgroundColor = .white
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
    }
}
