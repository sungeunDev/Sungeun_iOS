//
//  ViewController.swift
//  Capter03-TabBar
//
//  Created by sungnni on 2018. 4. 4..
//  Copyright © 2018년 ssungnni. All rights reserved.
//


/***************************************************
 < TabBar Customizing>
 
 -. clipsToBounds 속성
 -. 외형 프록시 객체
 -. 앱 델리게이트 클래스 교체 방법
 -. 애니메이션 처리 방법 
 ***************************************************/

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let frame = CGRect(x: 0, y: 100, width: 100, height: 30)
//        let title = UILabel(frame: frame)
        
        // 인라인(Inline)방식 : 여러 줄의 코드를 한줄로 줄여 작성하는 것.
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        // x는 나중에 center로 재조정할거고, size도 sizeTofit으로 조정될거라 임의값 삽입.
        
        title.text = "첫번째 탭"
        title.textColor = UIColor.red
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 14)
        
        title.sizeToFit() // 콘텐츠의 내용에 맞게 레이블 크기 변경
        // 콘텐츠가 동적으로 설정될 경우, 엘립시스(ellipsis, 생략) 이슈 발생
        
        title.center.x = self.view.frame.width / 2
        self.view.addSubview(title)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

