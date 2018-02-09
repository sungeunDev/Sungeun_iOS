//
//  ViewController.swift
//  test
//
//  Created by 박성은 on 2018. 2. 7..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var drinkImgView: UIImageView!
    private var drinkPriceLb: UILabel!
    private var drinkBtn: UIButton!
    
    var img: UIImage? {
        get {
            return drinkImgView.image!
        }
        set {
            drinkImgView.image = newValue
        }
    }
    
    var price: Int = 0
    
    var index: Int? {
        didSet {
            drinkBtn.tag = index!
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        create()
        updateLayer()
    }
    
    func create()
    {
        self.view.layer.borderWidth = 1
        self.view.layer.borderColor = UIColor.darkGray.cgColor
        
        drinkBtn = UIButton()
        self.view.addSubview(drinkBtn)
        
        drinkImgView = UIImageView()
        drinkImgView.contentMode = .scaleAspectFit
        self.view.addSubview(drinkImgView)
        
        drinkPriceLb = UILabel()
        drinkPriceLb.text = "\(price)원"
        drinkPriceLb.textAlignment = .right
        drinkPriceLb.textColor = .black
        self.view.addSubview(drinkPriceLb)
    }
    
    func updateLayer()
    {
        drinkBtn.frame = self.view.bounds
        drinkImgView.frame = CGRect(x: 0,
                                    y: 0,
                                    width: self.view.frame.size.width,
                                    height: self.view.frame.size.height*4/5)
        drinkPriceLb.frame = CGRect(x: 0,
                                    y: self.view.frame.size.height*4/5,
                                    width: self.view.frame.size.width,
                                    height: self.view.frame.size.height/5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

