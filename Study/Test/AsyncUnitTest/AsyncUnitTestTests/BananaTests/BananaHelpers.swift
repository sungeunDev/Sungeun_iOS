//
//  BananaHelpers.swift
//  AsyncUnitTestTests
//
//  Created by Ari on 28/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import Foundation

// "환경구축" 코드를 여러 테스트에서 공유하기
internal func createNewPeeledBanana() -> Banana {
    let banana = Banana()
    banana.peel()
    return banana
}
