/**
 * Copyright 2015-2018 Kakao Corp.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit

class UserMgmtViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var doneSignup:Bool = false
    fileprivate var user:KOUser? = nil
    fileprivate let menu = ["me", "업데이트 프로필", "Unlink", "톡 프로필 보기"]
    fileprivate let menuBeforeSignup = ["Signup"]
    fileprivate var singleTapGesture: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(UserMgmtViewController.profileImageTapped(_:)))
        singleTapGesture.numberOfTapsRequired = 1
        singleTapGesture.numberOfTouchesRequired = 1
        
        tableView.delegate = self;
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        let nib = UINib(nibName: "UserMgmtTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "UserMgmtTableViewCell")
        
        requestMe()
    }
    
    fileprivate func requestMe(_ displayResult: Bool = false) {
        KOSessionTask.meTask { [weak self] (user, error) -> Void in
            if let error = error as NSError? {
                self?.showErrorMessage(error)
                self?.doneSignup = false
            } else {
                if displayResult {
                    UIAlertController.showMessage((user as! KOUser).description);
                }
                
                self?.doneSignup = true
                self?.user = (user as! KOUser)
                self?.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            if self.doneSignup {
                return menu.count
            } else {
                return menuBeforeSignup.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath as NSIndexPath).section == 0 {
            let cell:UserMgmtTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserMgmtTableViewCell") as! UserMgmtTableViewCell
            cell.setUser(self.user)
            
            var addGesture = true
            if let gestures: [AnyObject] = cell.thumbnail.gestureRecognizers {
                addGesture = gestures.filter {$0 as? UIGestureRecognizer == self.singleTapGesture}.isEmpty
            }
            
            if addGesture {
                cell.thumbnail.addGestureRecognizer(singleTapGesture)
                cell.thumbnail.isUserInteractionEnabled = true
            }
            
            return cell
        }
        
        var normalCell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if normalCell == nil {
            normalCell = IconTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        }

        normalCell?.imageView?.image = UIImage(named: "UserMenuIcon\((indexPath as NSIndexPath).row)")
        if self.doneSignup {
            normalCell?.textLabel?.text = menu[(indexPath as NSIndexPath).row]
        } else {
            normalCell?.textLabel?.text = menuBeforeSignup[(indexPath as NSIndexPath).row]
        }
    
        return normalCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath as NSIndexPath).section == 0 && (indexPath as NSIndexPath).row == 0 {
            return 368
        }
        return 48
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if  (indexPath as NSIndexPath).section == 0 {
            return;
        }
        
        if self.doneSignup == false {
            switch (indexPath as NSIndexPath).row {
            case 0:
                KOSessionTask.signupTask(withProperties: getFormData(), completionHandler: { [weak self] (success, error) -> Void in
                    if let error = error as NSError? {
                        self?.showErrorMessage(error)
                    } else {
                        self?.requestMe()
                    }
                })
            default:
                fatalError("no menu item!!")
            }
        } else {
            switch (indexPath as NSIndexPath).row {
            case 0:
                requestMe(true)
            case 1:
                KOSessionTask.profileUpdate(withProperties: getFormData(), completionHandler: { [weak self] (success, error) -> Void in
                    if let error = error as NSError? {
                        self?.showErrorMessage(error)
                    } else {
                        UIAlertController.showMessage("프로필 업데이트에 성공하셨습니다.")
                    }
                })
            case 2:
                KOSessionTask.unlinkTask(completionHandler: { [weak self] (success, error) -> Void in
                    if let error = error as NSError? {
                        self?.showErrorMessage(error)
                    } else {
                        print("User unlink is successfully completed!")
                        _ = self?.navigationController?.popViewController(animated: true)
                    }
                })
            case 3:
                performSegue(withIdentifier: "TalkProfile", sender: self)
            default:
                fatalError("no menu item!!")
            }
        }
    }
    
    fileprivate func showErrorMessage(_ error: NSError) {
        if error.code == Int(KOErrorCancelled.rawValue) {
            UIAlertController.showMessage("에러! 다시 로그인해주세요!")
        } else {
            let description = error.userInfo[NSLocalizedDescriptionKey] as? String;
            UIAlertController.showMessage(NSString(format: "에러! code=%d, msg=%@", error.code, (description != nil ? description: "unknown error")!) as String)
        }
    }
    
    fileprivate func getFormData() -> [AnyHashable: Any] {
        let indexPath = IndexPath(item: 0, section: 0)
        let cell = self.tableView.cellForRow(at: indexPath) as! UserMgmtTableViewCell
        
        return cell.getUser()
    }
    
    @objc func profileImageTapped(_ recognizer: UITapGestureRecognizer) {
        if user == nil || user?.properties == nil || user?.properties?[KOUserProfileImagePropertyKey] == nil {
            return
        }
        
        if let imageUrl = user?.properties?[KOUserProfileImagePropertyKey] as? String , imageUrl.isEmpty {
            return
        }
        
        self.performSegue(withIdentifier: "ProfileImage", sender: user?.properties?[KOUserProfileImagePropertyKey])
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProfileImage" {
            let viewController: ProfileImageViewController = (segue.destination as? ProfileImageViewController)!
            viewController.profileImageUrlString = sender as? String
            
        }
    }
}
