//
//  ViewController.swift
//  SKPaymentTest
//
//  Created by Ari on 30/10/2018.
//  Copyright © 2018 ssungnni. All rights reserved.
//

import UIKit
import StoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        if SKPaymentQueue.canMakePayments() {
            
            let request = SKProductsRequest(productIdentifiers: ["test"])
            request.delegate = self
            request.start()
        }
    }
    
    @IBAction func btnAction() {
//        let payment = SKPayment(product: ["test"])
//        SKPaymentQueue.default().add(payment)
    }

}

extension ViewController: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        print("----------------< productsRequest >----------------")
        
        
    }
    
    
}

