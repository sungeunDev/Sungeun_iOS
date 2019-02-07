/// Copyright (c) 2019 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import Moya

public enum Marvel {
  static private let publicKey = "99b48b5db8b337474bfbad8baa5a4807"
  static private let privateKey = "ec383f239bc8f048d98ee3e5f338921f57f09768"
  
  // endpoint - marvel api
  case comics
}

extension Marvel: TargetType {
  public var baseURL: URL {
    return URL(string: "https://gateway.marvel.com/v1/public")!
  }
  
  public var path: String {
    switch self {
    case .comics:
      return "/comics"
    }
  }
  
  public var method: Moya.Method {
    switch self {
    case .comics:
      return .get
    }
  }
  
  public var sampleData: Data {
    return Data()
  }
  
  /*
   ====================< Marvel API >====================
   - 서버 측 응용 프로그램은 apikey 매개 변수 외에도 두 개의 매개 변수를 전달해야합니다.
   
   ㅇ ts - 타임 스탬프 (또는 요청별로 변경할 수있는 다른 긴 문자열)
   ㅇ hash - ts 매개 변수의 md5 다이제스트, 개인 키 및 공개 키 (예 : md5 (ts + privateKey + publicKey)
   ex) 공개 키가 "1234"이고 개인 키가 "abcd"인 사용자는 다음과 같이 유효한 호출을 구성 할 수 있습니다
   http://gateway.marvel.com/v1/public/comics?ts=1&apikey=1234&hash=ffd275c5130566a2916217b101f26150 (해시 값은 1abcd1234의 md5 다이제스트)
   */
//  public var task: Task {
//    return .requestPlain
//  }
  
  public var task: Task {
    let ts = "\(Date().timeIntervalSince1970)"
    // 임의의 타임 스탬프, 개인키 및 공개키를 연결하고 전체 문제열을 MD5로 해싱하여 앞에서 설명한 것처럼 필요한 해시를 만듭니다.
    let hash = (ts + Marvel.privateKey + Marvel.publicKey).md5
    
    let authParams = ["apikey": Marvel.publicKey, "ts": ts, "hash": hash]
    
    switch self {
    case .comics:
      return .requestParameters(
        parameters: [
          "format": "comic",
          "formatType": "comic",
          "orderBy": "-onsaleDate",
          "dateDescriptor": "lastWeek",
          "limit": 50] + authParams,
        encoding: URLEncoding.default)
    }
  }
  
  public var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
  
  public var validationType: ValidationType {
    return .successCodes // 200-299
  }
}
