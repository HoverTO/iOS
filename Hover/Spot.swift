//
//  ViewController.swift
//  Hover
//
//  Created by Malik Ismail on 2017-02-13.
//  Copyright © 2017 Malik Ismail. All rights reserved.
//

/*
import UIKit
import Alamofire

struct post {
    let mainImage: UIImage!
    let name: String!
}

class TableViewController: UITableViewController {
    
    var posts = [post]()
    
    var searchURL = "https://api.spotify.com/v1/search?q=Shawn+Mendes&type=track"
    
    typealias JSONStandard = [String: AnyObject]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callAlamo(url: searchURL)
    }
    
    func callAlamo(url: String){
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            self.parseData(JSONData: response.data!)
            
        })
        
    }
    
    func parseData(JSONData: Data){
        do {
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
            if let tracks = readableJSON["tracks"] as? JSONStandard {
                if let items = tracks["items"] as? [JSONStandard]{
                    
                    for i in 0..<items.count {
                        let item = items[i]
                        print(item)
                        
                        let name = item["name"] as! String
                        
                        if let album = item["album"] as? JSONStandard {
                            if let images = album["images"] as? [JSONStandard]{
                                let imageData = images[0] // to grab the highest quality image
                                let mainImageURL = URL(string: imageData["url"] as! String)
                                let mainImageData = NSData(contentsOf: mainImageURL!)
                                
                                let mainImage = UIImage(data: mainImageData as! Data)
                                
                                posts.append(post.init(mainImage: mainImage, name: name))
                                self.tableView.reloadData()
                            }
                        }
                    }
                    
                }
            }
            // Want to be able to read and manipulate JSON so mutable
        } catch {
            print(error)
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let mainImageView = cell?.viewWithTag(2) as! UIImageView
        mainImageView.image = posts[indexPath.row].mainImage
        
        let mainLabel = cell?.viewWithTag(1) as! UILabel
        mainLabel.text = posts[indexPath.row].name
        
        return cell!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



import UIKit

class API {
    
    let apiEndPoint = "endpoint"
    let apiUrl:String!
    let consumerKey:String!
    let consumerSecret:String!
    
    var returnData = [:]
    
    init(){
        self.apiUrl = "https://myurl.com/"
        self.consumerKey = "my consumer key"
        self.consumerSecret = "my consumer secret"
    }
    
    func getOrders() -> NSDictionary{
        return makeCall("orders")
    }
    
    func getOrders(completionHandler: @escaping (Int?, Error?) -> ()) {
        makeCall("orders", completionHandler: completionHandler)
    }
    
    func makeCall(_ section: String, completionHandler: @escaping (NSDictionary?, Error?) -> ()) {
        let params = ["consumer_key":"key", "consumer_secret":"secret"]
        
        Alamofire.request("\(apiUrl)/\(apiEndPoint + section)", parameters: params)
            .authenticate(user: consumerKey, password: consumerSecret)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completionHandler(value as? NSDictionary, nil)
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }

    
}


func makeCall(section:String) -> NSDictionary{
    
    let params = ["consumer_key":"key", "consumer_secret":"secret"]
    
    Alamofire.request(.GET, "\(self.apiUrl)/\(self.apiEndPoint + section)", parameters: params)
        .authenticate(user: self.consumerKey, password: self.consumerSecret)
        .responseJSON { (request, response, data, error) -> Void in
            println("error \(request)")
            self.returnData = data! as NSDictionary
    }
    return self.returnData
}




let api = API()
api.getOrders() { responseObject, error in
    // use responseObject and error here
    
    print("responseObject = \(responseObject); error = \(error)")
    return
}

 */















































