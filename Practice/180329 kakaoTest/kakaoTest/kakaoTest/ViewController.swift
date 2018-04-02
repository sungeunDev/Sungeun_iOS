//
//  ViewController.swift
//  kakaoTest
//
//  Created by sungnni on 2018. 3. 29..
//  Copyright © 2018년 SsungNni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var loginBtn: KOLoginButton!
    
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginBtn = KOLoginButton(frame: CGRect(x: 30, y: 140, width: 320, height: 42))
        loginBtn.addTarget(self, action: #selector(invokeLoginWithTarget(_:)), for: .touchUpInside)
        self.view.addSubview(loginBtn)
    }
    
    
    @objc func invokeLoginWithTarget(_ sender: KOLoginButton) {
        guard let session = KOSession.shared() else { return }
        
        if !session.isOpen() {
            session.open(completionHandler: { (error) in
                guard session.isOpen() else { return }
                print("open")
                print(session.accessToken)
            })
        } else {
            session.close()
            print("close")
            session.open(completionHandler: { (error) in
                print("open")
                print(session.accessToken)
            })
        }
    }
    
    @IBAction private func kakaoLogin(_ sender: UIButton) {
        guard let session = KOSession.shared() else { return }
        // Close Old Session
        // 현재 세션 열려있는지 확인 -> true면 닫고, false면 ()
        session.isOpen() ? session.close() : ()
        
        session.open(completionHandler: { (error) in
            guard session.isOpen() else {
                // Open Session Failed
                error != nil ? print(error!.localizedDescription) : print("cancled")
                return
            }
            // 1번 방법
//            Session Login 후처리는 KOSessionDidchange Notification을 통해 처리
            // 2번 방법
//            let appDelegate = (UIApplication.shared.delegate as! AppDelegate) ~ 이렇게 처리해도 됨.
//            appDelegate.setupRootViewController 위의 경우 왼쪽 코드로 처리해야 하는데,
            // 3번 방법
//            AppDelegate에 static 변수 만들어두면, 아래 코드로 바로 호출 가능.
//            AppDelegate.instance.setupRootViewController

            print("Login Success")
        }, authTypes: [NSNumber(value: KOAuthType.talk.rawValue)]) // 무조건 간편 로그인으로 넘어감
        // 인증방법 설정 가능 : KOAuthType ( 1 << 1 )
        
        /***************************************************
         >>, << (쉬프트 연산자)
         왜 비트 연산을 하나요 -> 연산 속도 빠름
         
         1 << 2 (1을 2만큼 좌측으로 쉬프트 연산)
         1 -> 100 = 4가 됨.
         
         1 << 3 (1을 3만큼 좌측으로 쉬프트 연산)
         1 -> 1000 = 8이 됨.
         
         비트연산을 활용하면 1 & 2 & 1 = 2 (숫자 중 홀수개 있는거 찾기! 같은게 된답니다.)
         ----------------------------------------------------
         -. optionSet
         https://developer.apple.com/documentation/swift/optionset
         
         ex. ABCD : 1001 -> 합 9. A, D가 선택
         -> 하나의 변수(9)로 모든 걸 표현(A, D가 선택)할 수 있음.
         
         ex. optionSet (UIViewAnimationOptions)
         UIView.animate(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, usingSpringWithDamping: <#T##CGFloat#>, initialSpringVelocity: <#T##CGFloat#>, options: UIViewAnimationOptions, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
         [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight
         ***************************************************/
        
    }

    // KOLogoutButton 은 따로 없음.
    @IBAction private func kakaoLogout(_ sender: UIButton) {
        guard let session = KOSession.shared() else { return }
        session.logoutAndClose { (success, error) -> Void in
            if error != nil {
                return print(error!.localizedDescription)
            }
            // Logout Success
        }
    }


    @IBAction func taskSingUp() {
        KOSessionTask.signupTask(withProperties: nil) { (success, error) in
            if success {
                print(success)
            } else {
                print(error!.localizedDescription)
            }
        }
    }


    @IBAction func taskSingOut() {
        KOSessionTask.unlinkTask { (success, error) in
            if success {
                print(success)
            } else {
                print(error!.localizedDescription)
            }
        }
    }

    @IBAction func nickName() {
        
        // 특정 키값을 가진 정보만 로드
        KOSessionTask.meTask(withPropertyKeys: [KOUserNicknamePropertyKey, KOUserProfileImagePropertyKey, KOUserThumbnailImagePropertyKey, "age"], completionHandler: { (result, error) in
            
            if (result != nil) {
               let kakao : KOUser = result as! KOUser
                print(kakao)
                
                let nickName = kakao.properties!["nickname"]! as! String
                let imgUrl = kakao.properties!["profile_image"]! as! String
                
                let thumb = kakao.properties!["thumbnail_image"]! as? String
                
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "KakaoViewController") as! KakaoViewController
                nextVC.name = nickName
                nextVC.imgUrl = imgUrl
                nextVC.thumbUrl = thumb
                
                let property = ["age":"27"]

                // 사용자에 새로운 property 등록. 웹페이지에도 동일한 이름의 키값이 등록되어져 있어야 함.
                KOSessionTask.profileUpdate(withProperties: property) { (success, error) in
                    if success {
                        print("save property")
                        guard let age = kakao.properties!["age"]! as? String else { return }
                        nextVC.age = age

                    } else {
                        print(error!.localizedDescription)
                    }
                }
                
                self.navigationController?.pushViewController(nextVC, animated: true)
                
            } else {
                print(error!.localizedDescription)
            }
        })
    }
    
    
    @IBAction func teacher() {
        
        // 모든 정보를 로드
        KOSessionTask.meTask { [weak self] (result, error) in
            
            if error != nil {
            print(error!.localizedDescription)
            return
        }
        
        let user = result as! KOUser
        print(user)
        
        guard let properties = user.properties,
            let name = properties[KOUserNicknamePropertyKey] as? String,
            let profileImageLink = properties[KOUserProfileImagePropertyKey] as? String,
            let thumbnailImageLink = properties[KOUserThumbnailImagePropertyKey] as? String,
            let age = properties["age"] as? String
            else { return }
            
            self?.nameLabel.text = name
            self?.ageLabel.text = age
            
            let imageLinks = [profileImageLink, thumbnailImageLink]
            for link in imageLinks {
                let url = URL(string: link)!
                let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                        return
                    }
                    guard let data = data, let image = UIImage(data: data) else { return }
                    DispatchQueue.main.async {
                        if link == profileImageLink {
                            self?.profileImageView.image = image
                        } else {
                            self?.thumbnailImageView.image = image
                        }
                    }
                })
                task.resume()
            }
        }
    }
}

