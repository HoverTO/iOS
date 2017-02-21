//
//  MatchPageViewController.swift
//  Hover
//
//  Created by Malik Ismail on 2017-02-16.
//  Copyright © 2017 Malik Ismail. All rights reserved.
//

import UIKit
import Alamofire

struct matchUser {
    let id: Int!
    let email: String!
    let phone: String!
    let gender: String!
    let company: String!
    let position: String!
    let first_name: String!
    let last_name: String!
    let office_lat: String!
    let office_lon: String!
    let home_lat: String!
    let home_lon: String!
    let radio_stations: [String]
    let talkativeness: Int!
    let smoke: Bool!
    let ac: Bool!
    let times: [String: Int]
    let compatibility: String!
}

fileprivate let reuseIdentifier = "Match_Cell"
fileprivate let screenWidth = UIScreen.main.bounds.width

class MatchPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var matchlistURL = "http://hoverapp.herokuapp.com/users"
    var matches = [matchUser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //callAlamo(url: matchlistURL)
        // Do any additional setup after loading the view.
        parseLocalJSON()
        
        print(matches.count)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        //setupCollectionViewCells()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callAlamo(url: String)
    {
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            //self.parseData(JSONData: response.data!)
            
        })
    }
    
    func parseLocalJSON(){
        let path = Bundle.main.path(forResource: "Users", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        let jsonData = try? Data(contentsOf: url, options: Data.ReadingOptions.mappedIfSafe)
        
        do {
            if let json_Data = try JSONSerialization.jsonObject(with: jsonData!) as? [String: Any], let matches_array = json_Data["users"] as? [[String:Any]] {
                for match in matches_array {
                    matches.append(matchUser.init(id: match["id"] as! Int!, email: match["email"] as! String!, phone: match["phone"] as! String!, gender: match["gender"] as! String!, company: match["company"] as! String!, position: match["position"] as! String!, first_name: match["first_name"] as! String!, last_name: match["last_name"] as! String!, office_lat: match["office_lat"] as! String!, office_lon: match["office_lon"] as! String!, home_lat: match["home_lat"] as! String!, home_lon: match["home_lon"] as! String!, radio_stations: match["radio_stations"] as! [String], talkativeness: match["talkativeness"] as! Int!, smoke: match["smoke"] as! Bool!, ac: match["ac"] as! Bool!, times: match["times"] as! [String : Int], compatibility: "88%"))
                
                    print(match["id"]!)
                    
                }
                
            }
            
            
        } catch {
            print(error)
        }
        
    }
    
    // MARK: - Setup
    
    
    func setupCollectionViewCells() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        let padding: CGFloat = 10
        let itemWidth = screenWidth/3 - padding
        let itemHeight = screenWidth/3 - padding
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        collectionView.collectionViewLayout = layout
    }
    
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("I'm setting up collection view")
        return matches.count //vendingMachine.selection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Match_Cell", for: indexPath) as? MatchCell else { fatalError() }
        
        let item = matches[indexPath.row]
        cell.MatchNameLabel.text = item.first_name
        cell.MatchCompanyLabel.text = item.company
        cell.MatchCompatibilityLabel.text = item.compatibility
        
        //cell.iconView.image = item.icon()
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    // The function below is called anytime an item is tapped
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateCell(having: indexPath, selected: true)
        
        // Reset the quantityStepper value to 1 each time

        print(matches[indexPath.row].id)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        updateCell(having: indexPath, selected: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        updateCell(having: indexPath, selected: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        updateCell(having: indexPath, selected: false)
    }
    
    func updateCell(having indexPath: IndexPath, selected: Bool) {
        
        let selectedBackgroundColor = UIColor(red: 255/255.0, green: 102/255.0, blue: 102/255.0, alpha: 1.0)
        let defaultBackgroundColor = UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = selected ? selectedBackgroundColor : defaultBackgroundColor
        }
    }
    
    /*
     func parseData(JSONData: Data){
     do {
     var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! [String: AnyObject]
     
     for i in 0..<readableJSON.count {
     let match = readableJSON[i]
     
     matches.append(matchUser.init(id: match["id"], email: match["email"], phone: match["phone"], gender: match["gender"], company: match["company"], position: match["position"], first_name: match["first_name"], last_name: match["last_name"], office_lat: match["office_lat"], office_lon: match["office_lon"], home_lat: match["home_lat"], home_lon: match["home_lon"], radio_stations: match["radio_stations"], talkativeness: match["talkativeness"], smoke: match["smoke"], ac: match["ac"], times: match["times"], compatibility: "88%"))
     
     print(item)
     
     }
     
     
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
     
     */


}
