//
//  Monkey.swift
//  AsyncUnitTest
//
//  Created by Ari on 28/01/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import Foundation

public struct Monkey {
    var name: String
    var silliness: Silliness
    
    enum Silliness{
        case extremelySilly
        case notSilly
        case verySilly
    }
}

public func silliest(_ monkeys: [Monkey]) -> [Monkey] {
    return monkeys.filter { $0.silliness == .verySilly || $0.silliness == .extremelySilly }
}

public func contains(_ list: [Monkey], _ compareMonkey: Monkey) -> Bool {
    let filteredMonkey = list.filter { (monkey) -> Bool in
        if monkey.name == compareMonkey.name &&
            monkey.silliness == compareMonkey.silliness {
            return true
        } else {
            return false
        }
    }
    if filteredMonkey.count != 0 {
        return true
    } else {
        return false
    }
}
