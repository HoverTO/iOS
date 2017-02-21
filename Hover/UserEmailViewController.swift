//
//  UserEmailViewController.swift
//  Hover
//
//  Created by Malik Ismail on 2017-02-18.
//  Copyright © 2017 Malik Ismail. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

struct newUser2 {
    var id: Int!
    var email: String!
    var first_name: String!
    var last_name: String!
}

var testUser = newUser2()

class UserEmailViewController: UIViewController {
    
    @IBOutlet weak var UserEmailTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func CheckUserButton(_ sender: Any) {
        
        
        new_User.email = UserEmailTextField.text!
        
        let alert = UIAlertController(title: nil, message: "Checking for user...", preferredStyle: .alert)
        
        alert.view.tintColor = UIColor.black
        let loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        loadingIndicator.frame = CGRect(x: 10, y: 5, width: 50, height: 50)
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true, completion: nil)
        
        guard let vc = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "SignUpOneVC") as? SignUpOneViewController else {
            print("Could not instantiate view controller with identifier of type SecondViewController")
            return
        }
        
        new_User.getUserData(){ responseObject, error in
            
            // no error handling, if let responseObject {....} else {display user not found, dismiss animation}
            
            if responseObject != nil  {
                new_User.id = responseObject!["id"]! as! Int
                new_User.first_name = responseObject!["first_name"]! as! String
                new_User.last_name = responseObject!["last_name"]! as! String
                print("First Name = \(new_User.first_name), Last Name = \(new_User.last_name)")
                
                
                loadingIndicator.stopAnimating()
                alert.message = "User Found!"
                let OKAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                    // segue here
                    self.navigationController?.pushViewController(vc, animated:true)
                }
                alert.addAction(OKAction)
            }
            
            else {
                loadingIndicator.stopAnimating()
                alert.message = "User Not Found!"
                let NotFoundAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                    // segue here
                    // self.dismiss(animated: false, completion: nil)
                }
                alert.addAction(NotFoundAction)
                
            }
            
            
            
            return
        }
        /*
        var user = newUser2()
        user.email = UserEmailTextField.text!
        
        Alamofire.request("https://hoverapp.herokuapp.com/users/1", method: .get).responseJSON(completionHandler: {
            response in
            var value = response.result.value as? [String: Any]
            user.first_name = value!["first_name"] as! String!
            print("hello this is a test: \(user.first_name)")
            
        })
        */

      //  print(user.first_name)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    func parseLocalJSON(email: String) -> String {
        let path = Bundle.main.path(forResource: "Users", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        let jsonData = try? Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
        
        do {
            if let json_Data = try JSONSerialization.jsonObject(with: jsonData!) as? [String: Any], let matches_array = json_Data["users"] as? [[String:Any]] {
                for match in matches_array {
                    if email == (match["email"] as! String!) {
                        return match["first_name"] as! String!
                    }
                }
                
                
            }
            
            
        } catch {
            print(error)
        }
        
        return ("User does not exist")
        
    }
    */

    
}
