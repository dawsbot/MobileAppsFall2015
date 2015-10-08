//
//  ViewController.swift
//  mapExample
//
//  Created by Dawson Botsford on 10/8/15.
//  Copyright © 2015 Dawson Botsford. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = MKCoordinateSpanMake(0.05 , 0.05)
        //let region = MKCoordinateRegionMake(manager.location.coordinate, span)
        
        mapView.setRegion(region, animated: true)
        

    }
        
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let location = CLLocationCoordinate2D(latitude: 40.74836, longitude: 73.984607)
                let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        annotation.title = "Empire State Building"
        
        annotation.subtitle = "NY"
        mapView.addAnnotation(annotation)
        
        //MKMapType.Standard
        mapView.mapType = MKMapType.Satellite
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

