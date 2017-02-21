//
//  ViewController.swift
//  Hover
//
//  Created by Malik Ismail on 2017-02-13.
//  Copyright © 2017 Malik Ismail. All rights reserved.
//

import UIKit
import Alamofire



class ViewController: UIViewController {

    typealias JSONStandard = [String: AnyObject]
    
    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPosition: UITextField!
    @IBOutlet weak var textFieldPhoneNumber: UITextField!
    @IBOutlet weak var labelMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getUserData(user_id: "1")
        // addUserData(user_id: "1")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func buttonRegister(_ sender: UIButton) {
        
        //addUserData(user_id: "1")

    }

    
 /*   func getUserData(user_id: String){
        
        
        Alamofire.request("https://hoverapp.herokuapp.com/users/\(user_id)", method: .get).responseJSON(completionHandler: {
            response in
            self.parseData(JSONData: response.data!)
            
        })
    }
 
 */
 
/*
    func addUserData(user_id: String){
        
        //creating parameters for the post request
        let parameters: Parameters=[
            "first_name":textFieldName.text!,
            "last_name":["92.5","93.5","99.9"],
            "email":textFieldEmail.text!,
            "position":textFieldPosition.text!,
            "phone":textFieldPhoneNumber.text!
        ]
        
        Alamofire.request("https://hoverapp.herokuapp.com/users/\(user_id)", method: .put, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: {
            response in
            //printing response
            print(response)
            
            //getting the json value from the server
            if let result = response.result.value {
                
                //converting it as NSDictionary
                let jsonData = result as! NSDictionary
                
                //displaying the message in label
                self.labelMessage.text = "User updated!"
            }
            }
        )

    }
    
    /*
    func parseData(JSONData: Data){
        do {
           
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
            
            if let id = readableJSON["id"] as! Int?, let email = readableJSON["email"], let phone = readableJSON["phone"], let gender = readableJSON["gender"] {
                
                print("\(id), \(email), \(phone), \(gender)")
                
            }
            
            
            
            // Want to be able to read and manipulate JSON so mutable
        } catch {
            print(error)
        }
        
    }
    */
*/
    
}

