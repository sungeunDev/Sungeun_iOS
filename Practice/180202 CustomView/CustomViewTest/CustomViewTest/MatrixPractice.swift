//
//  MatrixPractice.swift
//  CustomViewTest
//
//  Created by 박성은 on 2018. 2. 2..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class MatrixPractice: UIView {
    
    private var view: UIView!
    private var imageView: UIImageView!
    private var button: UIButton!
    private var titleLb: UILabel!
    private var subTitleLb: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        create()
        makeFrame()
    }
    
// UIView 의 크기가 변경되면, 크기가 변경된 UIView 의 서브뷰들은 위치와 크기가 조정되어야 한다. UIView 는 이를 위해 자동과 수동으로 UIView 의 layout을 조정하는 방법을 제공
    override func layoutSubviews() {
        super.layoutSubviews()
        makeFrame()
    }
    
    func create() {
        view = UIView()
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 4
        self.addSubview(view)
        
        imageView = UIImageView()
        view.addSubview(imageView)
        
        button = UIButton()
        view.addSubview(button)
        
        titleLb = UILabel()
        titleLb.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLb.textColor = .black
        titleLb.textAlignment = .center
        view.addSubview(titleLb)
        
        subTitleLb = UILabel()
        subTitleLb.textColor = .black
        subTitleLb.font = UIFont.systemFont(ofSize: 15)
        subTitleLb.textAlignment = .right
        view.addSubview(subTitleLb)
        
    }
    
    func makeFrame() {
        view.frame = CGRect(x: 0,
                            y: 0,
                            width: self.frame.size.width,
                            height: self.frame.size.width)
        imageView.frame = view.frame
        button.frame = view.frame
        
        let marginX: CGFloat = 10
        let marginY = view.frame.size.height / 5
        titleLb.frame = CGRect(x: marginX, y: marginY, width: view.frame.size.width-2*marginX, height: view.frame.size.height-2*marginY)
        subTitleLb.frame = CGRect(x: marginX, y: marginY*4, width: view.frame.size.width-2*marginX, height: marginY)
    }
    
    func image(named: String) {
        let img = UIImage(named: named)
        imageView.image = img
    }
    
    func addTarget(_ target: Any?, action: Selector, for controlEvents: UIControlEvents) {
        button.addTarget(target, action: action, for: controlEvents)
    }
    
    func title(title: String?, subtitle: String?){
        if let title = title, let subtitle = subtitle
        {
            titleLb.text = title
            subTitleLb.text = subtitle
        }
    }
    
    func tag(_ num: Int){
        button.tag = num
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
