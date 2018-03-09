//: Playground - noun: a place where people can play

import UIKit

func firstCitizen() {
    print("function call")
}

func function(_ parameter: @escaping () -> ()) -> (()->()) {
    return parameter
}

let returnValue = function(firstCitizen)
returnValue()
