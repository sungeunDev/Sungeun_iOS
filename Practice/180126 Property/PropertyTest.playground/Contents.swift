//: Playground - noun: a place where people can play

import UIKit

class AudioChannel {
     let level = 10
    static var maxLevel = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > level
            {
                currentLevel = level
            }
            if currentLevel > AudioChannel.maxLevel
            {
                AudioChannel.maxLevel = currentLevel
            }
        }
    }}

class Other : AudioChannel {
    let oo = AudioChannel.maxLevel
    let aa = AudioChannel.init().level
}
