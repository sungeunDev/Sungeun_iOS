//
//  ViewController.swift
//  KannaSample
//
//  Created by Ari on 19/03/2019.
//  Copyright © 2019 ssungnni. All rights reserved.
//

import UIKit
import Kanna

enum ScrapError: Error {
    case invalidURL
    case noPageInfo
    case networkError(String)
}

extension ScrapError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return NSLocalizedString("Error: url doesn't seem to be a valid URL", comment: "ScrapError - invalidURL")
        case .noPageInfo:
            return NSLocalizedString("Error: there is no page info", comment: "ScrapError - noPageInfo")
        case .networkError(let description):
            return NSLocalizedString("Error: \(description)", comment: "ScrapError - networkError")
        }
    }
}

enum PageUrlVer {
    case kor
    case eng
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parsingPageCount(urlVer: .kor, isbn: "9780194202411", completion: { page, error in
            guard error == nil else { print(error!.localizedDescription); return }
            print(page)
        })
    }
    
    // 교보문고 홈페이지에서 isbn으로 search -> 책의 쪽수만 파싱
    func parsingPageCount(urlVer: PageUrlVer, isbn: String, completion: @escaping ((String, ScrapError?) -> Void)) {
        var baseUrl: String {
            switch urlVer {
            case .kor:
                return "http://www.kyobobook.co.kr/product/detailViewKor.laf?barcode="
            case .eng:
                return "http://www.kyobobook.co.kr/product/detailViewEng.laf?ejkGb=ENG&barcode="
            }
        }
        
        guard let main = URL(string: baseUrl + isbn) else { completion("", .invalidURL); return }
        
        do {
            let lolMain = try String(contentsOf: main, encoding: .ascii)
            let doc = try HTML(html: lolMain, encoding: .utf8)
            let path = doc.xpath("//div[@class='box_detail_content']//table//td")
            
            if let page = path.dropFirst()
                .first(where: { _ in true })?
                .text?
                .dropLast(2) {
                completion(String(page), nil)
            } else {
                if urlVer == .kor { // 국내 서적 결과가 없을 경우 영문 서적 검색
                    parsingPageCount(urlVer: .eng, isbn: isbn, completion: completion)
                } else {
                    completion("", .noPageInfo)
                }
            }
        } catch let error {
            completion("", .networkError(error.localizedDescription))
        }
    }
}
