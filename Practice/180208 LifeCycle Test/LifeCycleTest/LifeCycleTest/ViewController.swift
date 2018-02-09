//
//  ViewController.swift
//  LifeCycleTest
//
//  Created by 박성은 on 2018. 2. 8..
//  Copyright © 2018년 SE. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        print("DidLoad")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //    @IBAction func btn(_ sender: Any) {
    //
    //
    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //        let nextVC: SEViewController = storyboard.instantiateViewController(withIdentifier: "SEViewController") as! SEViewController
    //
    //        self.present(nextVC, animated: true, completion: nil)
    //    }
    
    
    //    @IBAction func repeatbtn(_ sender: Any) {
    //        let nextVC2 = NextViewController()
    
    //        let nextVC2 = NextViewController(nibName: "NextViewController", bundle: nil)
    
    //        let storyboard2 = UIStoryboard(name: "Main", bundle: nil)
    //        let nextVC2: NextViewController = storyboard2.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    //
    //        nextVC2.modalTransitionStyle = .flipHorizontal
    //        self.present(nextVC2, animated: true, completion: nil)
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    //        if identifier == "mainToNext"
    //        {
    //            return true
    //        } else
    //        {
    //            return false
    //        }
    //    }
    //
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if let nextVC2 = segue.destination as? NextViewController
    //        {
    //            nextVC2.title = self.title
    //            print("haha")
    //        }
    //        if let secondVC = segue.destination as? NextViewController
    //        {
    //        }
    //    }
    
    
    //    override func viewDidAppear(_ animated: Bool) {
    //        super.viewDidAppear(true)
    //        print("viewDidAppear")
    //    }
    //
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(true)
    //        print("ViewWillAppear")
    //    }
    //
    //    override func viewWillDisappear(_ animated: Bool) {
    //        super.viewWillDisappear(true)
    //        print("ViewWillDisappear")
    //    }
    //
    //    override func viewDidDisappear(_ animated: Bool) {
    //        super.viewDidDisappear(true)
    //        print("viewDidDisappear")
    //    }
    //
    //    override func viewWillLayoutSubviews() {
    //        super.viewWillLayoutSubviews()
    //        print("viewWillLayoutSubviews")
    //    }
    //
    //    override func viewDidLayoutSubviews() {
    //        super.viewDidLayoutSubviews()
    //        print("viewDidLayoutsubviews")
    //    }
    //
    //    override func loadView() {
    //        super.loadView()
    //        print("loadView")
    //    }
    
    @IBAction func action(_ sender: Any) {
        
        let alertVC = UIAlertController(title: "타이틀", message: "메세지", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "오케이", style: .default)
        { (action) in
            //해당 버튼이 클릭되면 해야될 행동
            //            print("action1 clicked")
        }
        let action2 = UIAlertAction(title: "취이소", style: .destructive) { (action) in
            //취소시 해야될 행동
        }
        
        let action3 = UIAlertAction(title: "three", style: .default) { (action) in
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextVC: SEViewController = storyboard.instantiateViewController(withIdentifier: "SEViewController") as! SEViewController
            
            self.present(nextVC, animated: true, completion: nil)
        }
        
        let action4 = UIAlertAction(title: "four", style: .default) { (action) in
            //취소시 해야될 행동
        }
        
        alertVC.addAction(action1)
        alertVC.addAction(action2)
        alertVC.addAction(action3)
        alertVC.addAction(action4)
        
        self.present(alertVC, animated: true, completion: nil)
    }
}


