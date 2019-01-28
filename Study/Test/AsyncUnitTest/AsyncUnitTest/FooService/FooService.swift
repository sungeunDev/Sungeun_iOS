//
//  FooService.swift
//  AsyncUnitTest
//
//  Created by Ari on 24/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import Foundation

class FooService {
    private var workItem: DispatchWorkItem?
    
    public func execute(param: Any, delay: Double, complete: @escaping ((Any) -> Void)) {
        self.cancel()
        workItem = DispatchWorkItem(block: {
            complete(param)
        })
        DispatchQueue.main.asyncAfter(deadline: .now() + delay,
                                      execute: workItem!)
    }
    
    public func cancel() {
        workItem?.cancel()
    }
}
