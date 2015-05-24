//
//  ViewController.swift
//  MyWorld
//
//  Created by Reed Carson on 5/21/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit
import MapKit


public var addressInfo = String?("nothing")
public var categoryName = String?("nothing")



class MyAnnotation : MKPointAnnotation {
    
    var venueIndex: Int!
    

    
}



class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
   
    
    @IBOutlet weak var myMapView: MKMapView!
    
    var elManager = CLLocationManager()
    
    var elVenues: [[String:AnyObject]] = []
    
    var elCategories: [[String:AnyObject]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        elManager.requestWhenInUseAuthorization()
        
        elManager.delegate = self
        myMapView.showsUserLocation = true
        myMapView.userTrackingMode = .Follow
        myMapView.delegate = self
        
        elManager.startUpdatingLocation()
        
       
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        navigationController?.navigationBar.barTintColor = UIColor(red:1, green:0.76, blue:0.21, alpha:1)
        
        
        
//        let backItem = UIBarButtonItem(title: "Custom Text HERE", style: UIBarButtonItemStyle.Plain, target: navigationController, action: nil)
//        navigationnavigationItem.backBarButtonItem = backItem
        
        
//        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        
        navigationItem.title = "Venues"
        
        
        
      
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        if let location = locations.first as? CLLocation {
            
            println("latitude \(location.coordinate.latitude) longitude \(location.coordinate.longitude)")
            
            requestVenuesWithLocation(location, completion: { (venues) -> () in
            
                self.elVenues = venues as! [[String:AnyObject]]
                
//                self.elCategories = categories as! [[String:Anyobject]]
                
                for (index, venue) in enumerate(venues as! [[String:AnyObject]]) {
                    
                    if let locationInfo = venue["location"] as? [String:AnyObject]{
                        
//                                         if let categoriesInfo = venue["categories"] as? [[String:AnyObject]] {
//
//                                categoryName = categoriesInfo["name"]
//
//                            }
                        
//                        for (index, category) in enumerate(categories as! [[String:AnyObject]]) {
//                            
//                            if let categoryInfo = category["name"] as? [String:AnyObject] {
//                                
//                                categoryName = category["name"] as? String
//                                
//                            }
//                            
//                        }
                        
                        
                        
                        if let lat = locationInfo["lat"] as? Double, let lng = locationInfo["lng"] as? Double {
                            
                            let coordinate = CLLocationCoordinate2DMake(lat, lng)
                            let annotation = MyAnnotation()
                            
                            annotation.title      = venue["name"] as? String
                            annotation.venueIndex = index
                            annotation.coordinate = coordinate
                            
                            self.myMapView.addAnnotation(annotation)
                            
                            let address = locationInfo["address"] as? String
                            let country = locationInfo["country"] as? String
                            let state = locationInfo["state"] as? String
                            let city = locationInfo["city"] as? String
          
//                            VenuesViewController.addressLabel.text 
                            
                            addressInfo = locationInfo["country"] as? String
                            
//                            "\(address) \(city) \(state) \(country)"
                            
                            
                        }
                        
                    }
                    
                }
                
            })
            
            elManager.stopUpdatingLocation()
        }
        
        
    }
    
    func requestVenuesWithLocation(location: CLLocation, completion: (venues: [AnyObject]) -> ()) {
        
        let API_URL = "https://api.foursquare.com/v2/"
        let CLIENT_ID = "FKDRIAPTLWTWPIKHY0OLDAWI5YI5HPCPAROVNPS5J4HH1RKK"
        let CLIENT_SECRET = "C5KQZOBTLU0RBZQKCT5UZYXNKQ5JG3VD025ZTLDT1ZU1DRF5"
        
        let endpoint = API_URL + "venues/search?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&ll=\(location.coordinate.latitude),\(location.coordinate.longitude)&v=20150101"
        
        if let url = NSURL(string: endpoint) {
            
            
            let request = NSURLRequest(URL: url)
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (repsonse, data, error) -> Void in
                
                //                println(data)
                
                if let returnedInfo = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil)    as? [String:AnyObject] {
                    
                    println(returnedInfo)
                    
                    
                    if let responseInfo = returnedInfo["response"] as? [String:AnyObject] {
                        
                        if let venuesInfo = responseInfo["venues"] as? [AnyObject] {
                            
                            completion(venues: venuesInfo)
                            
                        }
                        
                    }
                    
                    
                }
                
                
                
            })
            
            
        }
        
        
    }
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        if annotation is MKUserLocation { return nil }
        
        var annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        var button = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as! UIButton

        annotationView.canShowCallout = true
        annotationView.rightCalloutAccessoryView = button
        annotationView.pinColor = MKPinAnnotationColor.Green
                
        
        button.tag = (annotation as! MyAnnotation).venueIndex
        button.addTarget(self, action: "showMoreInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return annotationView
        
        
    }
    
    //    [button addTarget:self action:@selector(showMoreInfo) forControlState: UIControlEvent];
    
    func showMoreInfo(sender: UIButton) {
        
        var venue = elVenues[sender.tag]
        
         var detailVC = storyboard?.instantiateViewControllerWithIdentifier("VenuesViewController") as! VenuesViewController
        
        var box = UIView(frame: CGRectMake(20, 20, 100, 100))
        box.backgroundColor = UIColor.blueColor()   
        
        navigationController?.pushViewController(detailVC, animated: true)
        
        detailVC.view.backgroundColor = UIColor.whiteColor()
        detailVC.navigationItem.title = venue["name"] as? String
       
        
        
        println("button clicked")
        view.setNeedsDisplay()  
        
    }
    
}