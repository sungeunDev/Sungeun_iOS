//
//  SimServer.swift
//  ProblemKit
//
//  Created by Joshua Park on 17/07/2018.
//  Copyright © 2018 Knowre. All rights reserved.
//

import Foundation

class SimServer {
    
    private static let bundle = Bundle(for: ProblemLoader.self)
    
    private static let networkDelay = 0.3
    
    /**
     Get the problem with the given identifier.
     
     - Note: Assume `completion` is always called with a `Data` object.
     
     - Parameters:
        - id: The problem identifier.
        - completion: The simulated network response.
        - data: Optional JSON data.
            The top level is convertible to a `Dictionary` type.
            This parameter is `nil` if network request failed.
 
            - Key: `problem`
            - Value: String
     */
    static func getProblem(id: Int,
                           completion: @escaping (_ data: Data?) -> Void)
    {
        let resourceID = String(id)
        
        let url  = bundle.url(forResource: resourceID,
                              withExtension: "json")!,
            data = try! Data(contentsOf: url)
        
        DispatchQueue
            .main
            .asyncAfter(deadline: .now() + networkDelay)
        {
            completion(data)
        }

    }
    
    /**
     Get the result of the problem with the given identifier.
     
     - Note: Assume `completion` is always called with a `Data` object.
     
     - Parameters:
        - answer: The user-submitted answer.
        - id: The problem identifier.
        - completion: The simulated network response.
        - data: Optional JSON data.
            The top level is convertible to a `Dictionary` type.
            This parameter is `nil` if network request failed.
 
            - Key: `result`
            - Value: Boolean
     */
    static func checkAnswer(_ answer: String,
                            id: Int,
                            completion: @escaping (_ data: Data?) -> Void)
    {
        let result = getResult(answer: answer,
                               problemID: id),
            data   = getJSONData(result: result)
        
        DispatchQueue
            .main
            .asyncAfter(deadline: .now() + networkDelay)
        {
                completion(data)
        }
    }
    
    private static func getResult(answer: String,
                                  problemID: Int) -> Bool
    {
        let table = [101 : ["x", "X"],
                     102 : ["y", "Y"],
                     103 : ["z", "Z"],
                     
                     201 : ["a", "A"],
                     202 : ["b", "B"],
                     203 : ["c", "C"],
                     204 : ["d", "D"],
                     205 : ["e", "E"],]
        
        return table[problemID]?.contains(answer) ?? false
    }
    
    private static func getJSONData(result: Bool) -> Data {
        let id  = result ? "correct" : "incorrect",
            url = bundle.url(forResource: id,
                             withExtension: "json")!
        
        return try! Data(contentsOf: url)
    }
    
}
