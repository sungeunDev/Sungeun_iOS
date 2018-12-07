//
//  NextViewController.swift
//  HowlFirebaseGoogleLogin
//
//  Created by Ari on 07/12/2018.
//  Copyright © 2018 ssungnni. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class NextViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func imageUploadAction(_ sender: UIButton) {
        let imgPick = UIImagePickerController()
        imgPick.delegate = self
        imgPick.allowsEditing = true
        imgPick.sourceType = .photoLibrary
        self.present(imgPick, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let image = (info[.originalImage] as! UIImage).pngData()
        let imageName = Auth.auth().currentUser!.uid + " \(Int(NSDate.timeIntervalSinceReferenceDate * 1000)).jpg"
        
        let riversRef = Storage.storage().reference().child("ios_images").child(imageName)
        
        riversRef.putData(image!, metadata: nil) { (metadata, error) in
            guard let metadata = metadata else {
                print("----------------< metaData >----------------")
                print(error?.localizedDescription)
                return
            }
            let size = metadata.size
            riversRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    print("----------------< downLoadURL >----------------")
                    print(error?.localizedDescription)
                    return
                }
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}
