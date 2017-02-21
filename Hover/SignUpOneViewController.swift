
//
//  SignUpOneViewController.swift
//  Hover
//
//  Created by Malik Ismail on 2017-02-15.
//  Copyright © 2017 Malik Ismail. All rights reserved.
//

import UIKit
import Alamofire

class SignUpOneViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverControllerDelegate {

    @IBOutlet weak var textFieldPhone: UITextField!
    @IBOutlet weak var HelloLabel: UILabel!
    
    @IBOutlet weak var userProfilePicture: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        HelloLabel.text! = "Hello, \(new_User.first_name). Welcome to Hover!"
        userProfilePicture.isUserInteractionEnabled = true
        
        userProfilePicture.layer.borderWidth = 1.0
        userProfilePicture.layer.masksToBounds = false
        userProfilePicture.layer.borderColor = UIColor.white.cgColor
        userProfilePicture.layer.cornerRadius = userProfilePicture.frame.size.width/2
        userProfilePicture.clipsToBounds = true
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:)))
        userProfilePicture.addGestureRecognizer(tapRecognizer)
        
        // Do any additional setup after loading the view.
    }

    func imageTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        //tappedImageView will be the image view that was tapped.
        //dismiss it, animate it off screen, whatever.
        let tappedImageView = gestureRecognizer.view!
        
        let image = UIImagePickerController()
        image.delegate = self
        var popover:UIPopoverController?=nil
        
        let alert:UIAlertController = UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default){
            (action) in image.sourceType = UIImagePickerControllerSourceType.camera
            
        }
        let galleryAction = UIAlertAction(title: "Gallery", style: .default){
            (action) in image.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(image, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default){
            (action) in
        }
        
        // Add the actions
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
        
        
        image.allowsEditing = true
        self.present(image, animated: true)
        {
            //After it is complete
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userProfilePicture.image = image
        }
        else {
            // Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ContinueButton(_ sender: Any) {

        new_User.phone = textFieldPhone.text!
        new_User.updateUser()

        
    }

}
