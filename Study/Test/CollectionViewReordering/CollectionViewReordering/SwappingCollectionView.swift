//
//  SwappingCollectionView.swift
//  CollectionViewReordering
//
//  Created by sungnni on 2018. 7. 25..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class SwappingCollectionView: UICollectionView {
  
  var indexPath: IndexPath?
  var cell: UICollectionViewCell?
  var snapView: UIView?
  
  var swapSet : Set<SwapDescription> = Set()
  var previousPoint : CGPoint?
  
  static let distanceDelta:CGFloat = 2
  
  
  override func beginInteractiveMovementForItem(at indexPath: IndexPath) -> Bool {
    self.indexPath = indexPath
    self.cell = self.cellForItem(at: indexPath)

    self.snapView = UIImageView(image: self.cell?.snapshot())
    self.snapView?.frame = self.cell!.frame
    
    self.addSubview(self.snapView!)
    self.bringSubview(toFront: self.snapView!)
    
    self.cell?.isHidden = true
    
    return true
    
    // 주어진 indexPath로 collectionView에서 cell을 찾고, 그 셀을 캡쳐해서 UIView로 생성.
    // CollectionView에 UIView를 addSubview하고, 제일 앞으로 보이도록 bringSubview(toFront:)
    // 그리고 cell을 hidden으로 안보이게 함.
  }
  
  override func updateInteractiveMovementTargetPosition(_ targetPosition: CGPoint) {
    
    // swap 하는 경우. 즉, 타겟 포지션과 시작 포지션이 일치하지 않을 때.
    if (self.shouldSwap(newPoint: targetPosition)) {
      
      if let hoverIndexPath = self.indexPathForItem(at: targetPosition),
        let interactiveIndexPath = self.indexPath {
      
        
        let swapDescription = SwapDescription(firstItem: interactiveIndexPath.item, secondItem: hoverIndexPath.item)
        
        if !(swapSet.contains(swapDescription)) {
          self.swapSet.insert(swapDescription)
          
          self.performBatchUpdates({
            self.moveItem(at: interactiveIndexPath, to: hoverIndexPath)
            self.moveItem(at: hoverIndexPath, to: interactiveIndexPath)
          }) { (finished) in
            self.swapSet.remove(swapDescription)
            self.indexPath = hoverIndexPath
          }
        }
      }
    }
    
    // 스냅뷰의 위치 선정. & 현재 타겟 포지션이 이전 포지션이 됨.
    self.snapView?.center = targetPosition
    self.previousPoint = targetPosition
  }
  
  
  override func endInteractiveMovement() {
    self.cleanup()
  }
  
  override func cancelInteractiveMovement() {
    self.cleanup()
  }
  
}


// business logic
extension SwappingCollectionView {
  
  func cleanup() {
    // 셀 보여지게 하고
    self.cell?.isHidden = false
    // 캡쳐한거 제거하고
    self.snapView?.removeFromSuperview()
    
    // 기존에 설정한거 다 nil로.
    self.snapView = nil
    self.cell = nil
    self.indexPath = nil
    self.previousPoint = nil
    
    // 그리고 리무브.
    self.swapSet.removeAll()
  }
  
  func shouldSwap(newPoint: CGPoint) -> Bool {
    // 이전 포인트가 존재한다면,
    if let previousPoint = self.previousPoint {
      // 거리는 새로운 포인트와 이전 포인트의 거리
      let distance = previousPoint.distance(to: newPoint)
      return distance < SwappingCollectionView.distanceDelta // 거리가 2보다 작으면 true. 왜 2 ??
    }
    
    return false
  }
  
}
