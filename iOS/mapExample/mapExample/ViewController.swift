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
    var annotation = MKPointAnnotation()
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let span = MKCoordinateSpanMake(0.05 , 0.05)
        let region = MKCoordinateRegionMake(manager.location!.coordinate, span)
        
        mapView.setRegion(region, animated: true)
        
        
        annotation.coordinate=(manager.location?.coordinate)!
        annotation.title="We found you!"
        annotation.subtitle="Lat:\(manager.location!.coordinate.latitude), Long:\(manager.location!.coordinate.longitude)"
        mapView.addAnnotation(annotation)
        
    }
    
    
    func locationManager(manager: CLLocationManager,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            print("didchangeauth")
            if status==CLAuthorizationStatus.AuthorizedWhenInUse {
                locationManager.startUpdatingLocation() //starts the location
                manager
            }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError
        error: NSError) {
            var errorType=String()
            if let clError=CLError(rawValue: error.code) {
                if clError == .Denied {
                    errorType="access denied"
                    let alert=UIAlertController(title: "Error", message:
                        errorType, preferredStyle: UIAlertControllerStyle.Alert)
                    let okAction:UIAlertAction=UIAlertAction(title: "OK",
                        style:UIAlertActionStyle.Default, handler: nil)
                    alert.addAction(okAction)
                    presentViewController(alert, animated: true, completion:
                        nil)
                }
            }
    }
    
    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        
        let status:CLAuthorizationStatus =
        CLLocationManager.authorizationStatus()
        if status==CLAuthorizationStatus.NotDetermined{
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.distanceFilter=kCLDistanceFilterNone
        mapView.showsUserLocation=true
        
      
        mapView.mapType = MKMapType.Satellite
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

