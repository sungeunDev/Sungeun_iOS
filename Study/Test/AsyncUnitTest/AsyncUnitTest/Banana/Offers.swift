//
//  Offers.swift
//  AsyncUnitTest
//
//  Created by Ari on 28/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import Foundation

public func offer(banana: Banana) -> String {
    if banana.isEdible {
        return "Hey, want a banana?"
    } else {
        return "Hey, want me to peel this banana for you?"
    }
}
