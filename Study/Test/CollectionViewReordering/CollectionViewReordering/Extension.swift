//
//  Extension.swift
//  CollectionViewReordering
//
//  Created by sungnni on 2018. 7. 25..
//  Copyright © 2018년 sungeun. All rights reserved.
//

import UIKit

extension UIView {
  
  func snapshot() -> UIImage? {
    
    /***************************************************
     UIGraphicsBeginImageContext (UIKit - Drawing - drawing context primitives)
     ---------------------------------------------------
     Creates a bitmap-based graphics context with the specified options.
     지정된 옵션을 사용하여 비트 맵 기반 그래픽 컨텍스트를 만듭니다.
     
     The drawing environment is pushed onto the graphics context stack immediately.
     While the context created by this function is the current context,
     you can call the UIGraphicsGetImageFromCurrentImageContext() function to retrieve an image object based on the current contents of the context.
     When you are done modifying the context,
     you must call the UIGraphicsEndImageContext() function to clean up the bitmap drawing environment and remove the graphics context from the top of the context stack.
     You should not use the UIGraphicsPopContext() function to remove this type of context from the stack.
     그리기 환경은 그래픽 컨텍스트 스택에 즉시 푸시됩니다.
     이 함수로 만든 컨텍스트가 현재 컨텍스트이면, UIGraphicsGetImageFromCurrentImageContext() 함수를 호출하여 컨텍스트의 현재 내용을 기반으로 이미지 개체를 검색 할 수 있습니다.
     컨텍스트를 수정 한 후에는, UIGraphicsEndImageContext() 함수를 호출하여 비트 맵 드로잉 환경을 정리하고 컨텍스트 스택의 맨 위에서 그래픽 컨텍스트를 제거해야합니다.
     이 유형의 컨텍스트를 스택에서 제거하기 위해 UIGraphicsPopContext() 함수를 사용하면 안됩니다.
     
     In most other respects, the graphics context created by this function behaves like any other graphics context.
     You can change the context by pushing and popping other graphics contexts.
     You can also get the bitmap context using the UIGraphicsGetCurrentContext() function.
     다른 측면에서, 이 함수로 생성 된 그래픽 콘텍스트는 다른 그래픽 콘텍스트처럼 동작한다.
     다른 그래픽 컨텍스트를 push & pop함으로써 context를 변경할 수 있습니다.
     UIGraphicsGetCurrentContext() 함수를 사용하여 비트 맵 컨텍스트를 가져올 수도 있습니다.
     ***************************************************/

    // 1
    // func UIGraphicsBeginImageContextWithOptions(_ size: CGSize, _ opaque: Bool, _ scale: CGFloat)
    // = UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 1.0)
    UIGraphicsBeginImageContext(self.bounds.size)
    
    // 2
    guard let currentImageContext = UIGraphicsGetCurrentContext() else { return UIImage() }
    self.layer.render(in: currentImageContext)
    
    // 3
    let image = UIGraphicsGetImageFromCurrentImageContext()
    
    // 4
    UIGraphicsEndImageContext()
    
    // 5
    return image
    
    // 1. 현재 View의 size대로 Graphic Context 생성
    // -> 자동으로 graphic context stack에 push (UIView 객체를 사용해 drawing 하지 않는 경우, 수동으로 push(UIGraphicsPushContext(_:)) 해줘야 함.
    
    // 2. 현재 graphic context를 가져와서 UIView의 layer를 지정된 컨텍스트로 렌더링
    // UIGraphicsGetCurrentContext의 default는 nil이라서 optional. 1번에서 context가 만들어졌다면, context stack에 자동으로 Push되었기 때문에 nil 아님.
    
    // 3. 렌더링한 이미지 가져오기
    // 4. clean up drawing environment & context 스택의 맨 위에서 그래픽 컨텍스트 제거
    // 5. return image
    
    // 사실, 왜 렌더링하는건지 모르겠음. 2번을 건너뛰면 안되는건가?? 왜??? layer를 좀 봐야하나? @.@ 으
  }
  
  
  
  // func render(in ctx: CGContext) 예시 따라하기
  // CAShapeLayer에서 UIImage 생성하기
  func createCircle() -> UIImage? {
    let diameter: CGFloat = 100
    let rect = CGRect(origin: CGPoint.zero,
                      size: CGSize(width: diameter, height: diameter))
    
    let shapeLayer = CAShapeLayer() // 레이어 생성
    shapeLayer.fillColor = UIColor.white.cgColor
    shapeLayer.lineWidth = 10
    shapeLayer.path = CGPath(ellipseIn: rect,
                             transform: nil)
    
    let renderer = UIGraphicsImageRenderer(size: rect.size)
    
    // 원이 렌더링되는 cgContext 생성
    let image = renderer.image { (context) in
      return shapeLayer.render(in: context.cgContext)
    }
    
//    return image
    
    // 렌더링 후에 호출, 이미지 생성
    let circleImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return circleImage
  }
  
}


extension CGPoint {
  func distance(to point: CGPoint) -> CGFloat {
    return sqrt(pow((point.x - x), 2) + pow((point.y - y), 2))
  }
}


struct SwapDescription: Hashable {
  var firstItem: Int
  var secondItem: Int
  
  var hashValue: Int {
    get {
      return (firstItem * 10) + secondItem
    }
  }
}

func ==(lhs: SwapDescription, rhs: SwapDescription) -> Bool {
  return lhs.firstItem == rhs.firstItem && lhs.secondItem == rhs.secondItem
}
