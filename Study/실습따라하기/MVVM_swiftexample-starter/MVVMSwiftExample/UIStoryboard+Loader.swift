//
//  UIStoryboard+Loader.swift
//  MVVMExample
//
//  Created by Dino Bartosak on 18/09/16.
//  Copyright © 2016 Toptal. All rights reserved.
//

import UIKit

/***************************************************
 < open > : 모듈 외부에서 접근할 수 있는 가장 느슨한 접근한정자 (신규)
 < public > : 모듈 외부에서 접근할 수 있지만 상속은 되지 않고 override할수 없다.
 < internal > : 모듈일 경우 접근이 가능하고 아무것도 쓰지 않는 경우 기본 설정되는 접근한정자이다.
 < fileprivate > : 같은 파일일 경우, 접근할 수 있도록 한 접근 한정자. 다른 swift 파일에서는 접근할 수 없음. (신규)
 < private > : 클래스 등이 선언된 영역내에서만 접근이 가능하다.
 
 ** 모듈(module)은 라이브러리등을 import하여 사용하는 것중 UIKit, MapKit, CoreData등이 이에 해당한다.
 ** 출처: https://swifter.kr/2016/10/09/%EC%83%88%EB%A1%9C%EC%9A%B4-%EC%A0%91%EA%B7%BC%ED%95%9C%EC%A0%95%EC%9E%90-open-fileprivate%EC%97%90-%EB%8C%80%ED%95%B4/
 ***************************************************/

fileprivate enum Storyboard : String {
    case main = "Main"
}

fileprivate extension UIStoryboard {
    
    static func loadFromMain(_ identifier: String) -> UIViewController {
        return load(from: .main, identifier: identifier)
    }
    // add convenience methods for other storyboards here ...
    
    // ... or use the main loading method directly when instantiating view controller
    // from a specific storyboard
    static func load(from storyboard: Storyboard, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
}

// MARK: App View Controllers

extension UIStoryboard {
    static func loadGameScoreboardEditorViewController() -> GameScoreboardEditorViewController {
        return loadFromMain("GameScoreboardEditorViewController") as! GameScoreboardEditorViewController
    }
}
