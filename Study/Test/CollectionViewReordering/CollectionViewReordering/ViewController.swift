//
//  ViewController.swift
//  CollectionViewReordering
//
//  Created by sungnni on 2018. 7. 25..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var collectionview: UICollectionView!
  var arr = Array(1...50)
  
  @IBOutlet weak var image: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    let circle = self.view.createCircle()
//    if let circle = circle {
//        image.image = circle
//    }
//    image.image = UIGraphicsGetImageFromCurrentImageContext()
    
    
  }


  @IBAction func longGesture(_ sender: UILongPressGestureRecognizer) {
    let location = sender.location(in: collectionview) // location은 CGPoint로 좌표를 나타냄.
    print(location)
    switch sender.state { // 제스쳐의 상태에 따라
    case .began:
      print("\n---------- [ began ] -----------\n")
      guard let itemIndexPath = collectionview.indexPathForItem(at: location) else { break } // 위치에 따라 콜렉션뷰의 indexPath 찾기
      collectionview.beginInteractiveMovementForItem(at: itemIndexPath) // 해당 indexPath가 움직이기 시작
    case .changed:
      // 움직임에 따라 location 좌표 실시간으로 변경됨. 그 좌표에 따라 타겟 위치(셀) 위치 업데이트
      collectionview.updateInteractiveMovementTargetPosition(location)
      // 이부분만 새로 만들어주면 될 것 같긴 한데.
      print("change")
    case .ended:
      collectionview.endInteractiveMovement() // 움직임 종료
    case .cancelled:
      collectionview.cancelInteractiveMovement()
    default:
      collectionview.cancelInteractiveMovement() // 그 외에는 움직임 취소
    }
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return arr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell: TestCell = collectionView.dequeueReusableCell(withReuseIdentifier: TestCell.id, for: indexPath) as! TestCell
    cell.testLabel.text = String(arr[indexPath.item])
    return cell
  }
  
  
  // DataSource -> source - destination을 어디로 보낼지에 대한 것.
  func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    guard sourceIndexPath != destinationIndexPath else { return } // source 와 destination 이 다를 경우,
    
    let item = self.arr[sourceIndexPath.item]
    self.arr.remove(at: sourceIndexPath.item)
    self.arr.insert(item, at: destinationIndexPath.item)
  }
  
  // delegate
  // updateInteractiveMovementTargetPosition (_ :) 시, 아래 메서드 호출
  // 이 메서드를 구현하지 않으면 컬렉션 뷰는 proposedIndexPath 매개 변수의 인덱스 경로를 사용합니다.
//  func collectionView(_ collectionView: UICollectionView,
//                      targetIndexPathForMoveFromItemAt originalIndexPath: IndexPath,
//                      toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
//
////    print("\n---------- [ updateInteractiveMovementTargetPosition 시 호출 ] -----------\n")
////    arr.swapAt(originalIndexPath.item, proposedIndexPath.item)
//
//    return originalIndexPath
//  }
  
}
