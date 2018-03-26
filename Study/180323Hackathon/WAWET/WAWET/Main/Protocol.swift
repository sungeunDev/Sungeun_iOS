//
//  Protocol.swift
//  WAWET
//
//  Created by sungnni on 2018. 3. 24..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import Foundation

protocol CustomViewDelegete {
    func customViewListener(title: String, subTitle: String)
    
    }

class CustomClass{
    
    var delegate: CustomViewDelegete?

}

