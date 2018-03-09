//
//  PracticeViewController.swift
//  0309
//
//  Created by 박성은 on 2018. 3. 9..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class PracticeViewController: UIViewController {

    let immutableArray = Array(1...40)
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        1. 배열의 각 요소 * index 값을 반환하는 함수
//        2. 배열 요소 중 홀수는 제외하고 짝수만 반환하는 함수
//        3. 배열의 모든 값을 더하여 반환하는 구현
//        4. immutableArray 에 대해서 1~3 번 함수를 차례대로 적용한 최종 값을 반환
        
    }
    
    func arrayReturn(list: [Int], index: Int) -> Int {
        return list[index] * index
    }
    
    func evenFilter(list: [Int]) -> [Int] {
        var newList = [Int]()
        for n in list {
            guard list[n] % 2 == 0 else { continue }
            newList.append(list[n])
        }
        return newList
    }
    
    func listSum(list: [Int]) -> Int {
        var sum = 0
        for num in list {
            sum += num
        }
        return sum
    }

    func oneToThree() -> Int {
        return listSum(list: evenFilter(list: immutableArray))
    }
    
}
