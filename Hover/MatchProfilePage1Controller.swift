//
//  MatchProfilePage1Controller.swift
//  Hover
//
//  Created by Malik Ismail on 2017-02-14.
//  Copyright © 2017 Malik Ismail. All rights reserved.
//

import UIKit
import Alamofire

class MatchProfilePage1Controller: UIViewController {

    @IBOutlet weak var MatchProfileNameLabel: UILabel!

    @IBOutlet weak var MatchProfilePhoneLabel: UILabel!
    
    @IBOutlet weak var MatchProfileEmailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUserData(user_id: "3")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUserData(user_id: String){
        
        
        Alamofire.request("https://hoverapp.herokuapp.com/users/\(user_id)", method: .get).responseJSON(completionHandler: {
            response in
            self.parseData(JSONData: response.data!)
            
        })
    }

    
    
     func parseData(JSONData: Data){
     do {
     
        var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! [String: AnyObject]
     
     if let name = readableJSON["first_name"], let email = readableJSON["email"], let phone = readableJSON["phone"], let gender = readableJSON["gender"] {
        
        MatchProfileNameLabel.text = name as! String
        MatchProfileEmailLabel.text = email as! String
        MatchProfilePhoneLabel.text = phone as! String
     
     }
     
     
     
     // Want to be able to read and manipulate JSON so mutable
     } catch {
     print(error)
     }
     
     }
 

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
