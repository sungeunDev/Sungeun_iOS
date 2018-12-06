//
//  ViewController.swift
//  PromiseKitSample
//
//  Created by Ari on 06/12/2018.
//  Copyright © 2018 ssungnni. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {

    /*
     ====================< 참고 링크 >====================
     - https://medium.com/flawless-app-stories/parallel-programming-with-swift-promises-740be1a260ed
     */
    
    let url = "https://jsonplaceholder.typicode.com/users"
    let imageUrl = "https://jsonplaceholder.typicode.com/photos"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         ====================< Guarantee >====================
         - As you can see, promises always have the option to fail.
         - But we do have cases which won’t have an error (e.g. returning a static text).
         - For this PromiseKit offers a special kind of Promise.
         - It’s called guarantee:
         */
        Guarantee { (seal) in
            seal("Hello World")
        }
        
        /*
         ====================< Usecase >====================
         - firstly indidcator active
         -> fetch server URL
         -> JSONParse
         -> fetch ImageURL
         -> ensure indicator inactive
         -> catch error
         */
        firstly {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            return fetch(url: <backendURL>)
            }.then { data in
                return JSONParsePromise(data) // we skip the wrapping of JSONParsing
            }.then { imageurl in
                return fetch(url: imageurl)
            }.then { data in
                imageView.image = UIImage(data: data)
            }.ensure {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }.catch { error in
                // in case we have an error
        }
        
        // Sometimes we want to return the same promise we’ve received. To do so, we can use get().
        // 보낸 데이터를 다시 받으려고 할 때
        firstly {
            return fetch(url: URL(string: url))
            }.get { (data) in
                
            }.done { (data) in
                
        }
        
        // In when() you add all promises you want to execute at the same time and it will wait for all of them to resolve before it continues.
        // when ()에서 동시에 실행하려는 모든 약속을 추가하면 계속하기 전에 모든 약속이 해결 될 때까지 기다립니다.
        firstly {
            when(fulfilled: promise1(), promise2())
            }.done { result1, result2 in
                //…
        }
        
        // Done
        // It basically tells the promise that the chains ends here and no return value will exists
        // 이것은 기본적으로 체인이 여기서 끝나고 반환 값이 존재하지 않는다고 약속
    }
    
    func fetch(url: URL) -> Promise<Data> {
        return Promise { seal in
            URLSession.shared.dataTask(with: url) { data, _, error in
                seal.resolve(data, error)
            }.resume()
        }
    }
}

