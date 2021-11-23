//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by 김지환 on 2021/11/23.
//

import UIKit
import MapKit

class TheaterViewController: UIViewController {
    
    var param: NSDictionary!
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        self.navigationItem.title = self.param["상영관명"] as? String
        
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        let regionRadius: CLLocationDistance = 100
        
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        let point = MKPointAnnotation()
        point.coordinate = location
        
        self.map.setRegion(coordinateRegion, animated: true)
        self.map.addAnnotation(point)
    }
}
