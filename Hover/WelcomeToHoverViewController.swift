//
//  WelcomeToHoverViewController.swift
//  Hover
//
//  Created by Malik Ismail on 2017-02-15.
//  Copyright © 2017 Malik Ismail. All rights reserved.
//

import UIKit
import Alamofire

var new_User = newUser(email: "")

class WelcomeToHoverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*
        getOrders(){ responseObject, error in
            
            print("responseObject = \(responseObject!)")
            test_var = responseObject!
            print("this is the value of test_var_initial: \(test_var)")
            
            return
        }
        */
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    func getOrders(completionHandler: @escaping (Int?, Error?) -> ()) {
        makeCall("orders", completionHandler: completionHandler)
    }
    
    func makeCall(_ section: String, completionHandler: @escaping (Int?, Error?) -> ()) {
        let params = ["consumer_key":"key", "consumer_secret":"secret"]
        
        Alamofire.request("https://hoverapp.herokuapp.com/users/1", parameters: params)
            .responseJSON { response in
                switch response.result {
                case .success(var user_id):
                    var value = response.result.value as? [String: Any]
                    user_id = value!["id"] as! Int!
                    completionHandler(user_id as? Int, nil)
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    */

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
