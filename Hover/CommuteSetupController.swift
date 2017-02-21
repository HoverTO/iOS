//
//  CommuteSetupController.swift
//  Hover
//
//  Created by Malik Ismail on 2017-02-15.
//  Copyright © 2017 Malik Ismail. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CommuteSetupController: UIViewController, CLLocationManagerDelegate {
    
    //Map
    @IBOutlet weak var CommuteMap: MKMapView!
    
    let manager = CLLocationManager()
    var geocoder = CLGeocoder()
    
    
    
    
    // This function is called everytime the user's location is updated
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Extract the user's location
        // All of the user's locations will be stored in the locations array
        let location = locations[0]
        
        // How much we want the map to be zoomed in on the user's location
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        
        // The user's location
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        CommuteMap.setRegion(region, animated: true)
        
        self.CommuteMap.showsUserLocation = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        // The desired accuracy that we want is the best accuracy
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        // Request the user to give permission to use location data when the app is in use
        manager.requestWhenInUseAuthorization()
        
        // Update the location
        manager.startUpdatingLocation()

        // Do any additional setup after loading the view.
        
         var address = "1 Infinite Loop, CA, USA"
         var geocoder = CLGeocoder()
        /*
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError!) -> Void in
            if let placemark = placemarks![0] {
                self.CommuteMap.addAnnotation(MKPlacemark(placemark: placemark))
            }
        } as! CLGeocodeCompletionHandler)
        
        */
    }
 
    
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
