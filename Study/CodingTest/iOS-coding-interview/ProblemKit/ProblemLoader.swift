//
//  ProblemLoader.swift
//  ProblemKit
//
//  Created by Joshua Park on 16/07/2018.
//  Copyright © 2018 Knowre. All rights reserved.
//

import Foundation

/**
 A simple networking client class.
 */
public class ProblemLoader {
    
    /**
     Fetches the problem with `id` from the server.
     
     - Parameters:
        - id: The problem identifier.
        - completion: The callback after the network request is completed.
     
            - `ProblemData`: The parameter is `nil` if the request failed.
                In case of success, the `ProblemData` object with
                the given `id` will be passed in.
     */
    public static func fetchProblem(id: Int,
                                    completion: @escaping (ProblemData?) -> Void)
    {
        // In a real situation, this would be a call to a remote app server.
        // Assume data is never `nil` for this project.
        DispatchQueue.global().async {
            SimServer.getProblem(id: id) { (data) in
                // TODO: Instantiate a ProblemData instance
                
                guard let data = data else { return }
                let problemData = try! JSONDecoder().decode(ProblemData.self, from: data)
                completion(problemData)
            }
        }
    }
    
    /**
     Checks the answer for the problem.
     
     - Parameters:
        - id: The problem identifier.
        - answer: The user-submitted answer.
        - completion: The callback after the network request is completed.
     
            - `Bool`: The parameter is `nil` if the request failed.
            In case of success, the parameter shows
            the result of the answer check.
     */
    public static func checkAnswer(_ answer: String,
                                   id: Int,
                                   completion: @escaping (Bool?) -> Void)
    {
        // In a real situation, this would be a call to a remote app server.
        // Assume data is never `nil` for this project.
        DispatchQueue.global().async {
            SimServer.checkAnswer(answer, id: id) { (data) in
                // TODO: Convert to a boolean result.
                guard let data = data else { return }
                let json = try! JSONSerialization.jsonObject(with: data, options: []) as? [String:Bool]
                guard let checkAnswer = json?["result"] else { return }
                completion(checkAnswer)
            }
        }

    }
    
    
    private init() { }
    
}
