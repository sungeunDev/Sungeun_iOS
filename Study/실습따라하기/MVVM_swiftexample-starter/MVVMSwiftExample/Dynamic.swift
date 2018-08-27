//
//  Dynamic.swift
//  MVVMSwiftExample
//
//  Created by sungnni on 2018. 8. 27..
//  Copyright © 2018년 Toptal. All rights reserved.
//

import Foundation

/***************************************************
 < ViewModel을 동적으로 만들기(Making the ViewModel Dynamic) >
 -. 데이터가 변경될 때, Model이 변경되었다는 걸 ViewModel & View에 알려야 함.
 
 ** 변경사항을 View에 전달해야 함.
 방법1. RxSwift
 방법2. NSNotification - 처리코드가 많이 필요하고, 구독 알림 / 취소 해줘야 함
 방법3. KVO(Key-Value-Observing) - 사용자 API 확인해야 함
 방법4. Generic & Closure 사용
        (참고: http://rasic.info/bindings-generics-swift-and-mvvm/)
 ***************************************************/


// Dynamic 타입은 특정 프로퍼티의 값이 변경할 수 있고, 동시에, 변경 리스너(change-listener) 객체에 알리는 역할.
class Dynamic<T> {
  typealias Listener = (T) -> ()
  var listener: Listener?

  func bind(_ listener: Listener?) {
    self.listener = listener
  }
  
  func bindAndFire(_ listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
  
  // 데이터가 업데이트가 필요할때, Dynamic프로퍼티 자체는 변하지 않습니다.
  // 반대로 value프로퍼티를 업데이트 합니다.
  var value: T {
    didSet {
      listener?(value)
    }
  }
  
  init(_ v: T) {
    self.value = v
  }
}
