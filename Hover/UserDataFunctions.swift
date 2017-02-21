//
//  UserDataFunctions.swift
//  Hover
//
//  Created by Malik Ismail on 2017-02-15.
//  Copyright © 2017 Malik Ismail. All rights reserved.
//

import Foundation
import Alamofire

var new_user_id = Int()

func addUserData(user_id: String, parameters: Parameters){
    
    Alamofire.request("https://hoverapp.herokuapp.com/users/\(user_id)", method: .put, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: {
        response in
        //printing response
        print(response)
        
    }
    )
}

func addNewUser(parameters: Parameters) -> Int {
    Alamofire.request("https://hoverapp.herokuapp.com/users", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: {
        response in
        //printing response
        
        print(response)
        
        new_user_id = parseData(JSONData: response.data!)
        
        print("this is the new user id in the response: \(new_user_id)")
        //return new_user_id
        
        //print(response)
        
    }
    )
    
    print("this is the new user id in addNewUser: \(new_user_id)")
    return new_user_id
    

}


func getUserData(user_id: Int){
    
    
    Alamofire.request("https://hoverapp.herokuapp.com/users/\(user_id)", method: .get).responseJSON(completionHandler: {
        response in
            print("This is the get request user id: \(user_id)")
            print("This is request: \(response.request)")
            print("THIS IS GET DATA: \(response)")
        //parseData(JSONData: response.data!)
        
    })
}



 func parseData(JSONData: Data) -> Int {
 do {
 
    var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! [String: AnyObject]
    if let id = readableJSON["id"] as! Int? {
        print("This is the new user id: \(id)")
        return id
    }
    
    
 //var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! ["String": AnyObject]
 
// if let id = readableJSON["id"] as! Int?, let email = readableJSON["email"], let phone = readableJSON["phone"], let gender = readableJSON["gender"] {
 
 //print("\(id), \(email), \(phone), \(gender)")
 
 //}
 
 
 
 // Want to be able to read and manipulate JSON so mutable
 } catch {
 print(error)
 }
 
    return 0
 }




