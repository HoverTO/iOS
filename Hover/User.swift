//
//  User.swift
//  Hover
//
//  Created by Malik Ismail on 2017-02-19.
//  Copyright © 2017 Malik Ismail. All rights reserved.
//

import Foundation
import Alamofire

class newUser {
    var id: Int = 0
    var email: String
    var phone: String = ""
    var gender: String = ""
    var company: String = ""
    var position: String = ""
    var first_name: String = ""
    var last_name: String = ""
    var office_lat: String = ""
    var office_lon: String = ""
    var home_lat: String = ""
    var home_lon: String = ""
    var radio_stations: [String] = []
    var talkativeness: Int = 0
    var smoke: Bool = false
    var ac: Bool = true
    var times: [String: Int] = [:]
    var compatibility: String = ""
    
    init(email: String) {
        self.email = email
    }
    
    func getUserData(completionHandler: @escaping ([String: Any]?, Error?) -> ()) {
        makeCall(self.email, completionHandler: completionHandler)
    }
    
    func makeCall(_ userEmail: String, completionHandler: @escaping ([String: Any]?, Error?) -> ()) {
        
        Alamofire.request("https://hoverapp.herokuapp.com/users")
            .responseJSON { response in
                switch response.result {
                case .success(var userData):
                    
                    let checkEmailBool = self.checkEmail(JSONData: response.data!, email: userEmail)
                    
                    if checkEmailBool.emailFound == true {
                        userData = checkEmailBool.match
                        completionHandler(userData as? [String: Any], nil)
                    }
                    else {
                        completionHandler(nil, nil)
                    }
                    
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    func checkEmail(JSONData: Data, email: String) -> (emailFound: Bool, match: [String:Any]?) {
        do {
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! [String: Any]
            
            if let matches_array = readableJSON["users"] as? [[String:Any]] {
                for match in matches_array {
                    if email == (match["email"] as! String!) {
                        return (true, match)
                    }
                }
            }
            
        } catch {
                print(error)
            }
        return (false, nil)
    }
    
    func updateUser() {
        var parameters: Parameters = ["id": self.id, "email": self.email, "phone": self.phone, "gender": self.gender, "company": self.company, "position": self.position, "first_name": self.first_name, "last_name": self.last_name, "office_lat": self.office_lat, "office_lon": self.office_lon, "home_lat": self.home_lat, "home_lon": self.home_lon, "radio_stations": self.radio_stations, "talkativeness": self.talkativeness, "smoke": self.smoke, "ac": self.ac, "times": self.times, "compatibility": self.compatibility]
        
        Alamofire.request("https://hoverapp.herokuapp.com/users/\(self.id)", method: .put, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: {
            response in
            //printing response
            print(response)
            
        }
        )

    }
}
