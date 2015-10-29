//
//  ViewController.swift
//  midterm
//
//  Created by Dawson Botsford on 10/29/15.
//  Copyright (c) 2015 Dawson Botsford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var roundTripMiles: UITextField!
    @IBOutlet weak var commuteTime: UILabel!
    @IBOutlet weak var gasToPurchase: UILabel!
    let numberFormatter = NSNumberFormatter()
    
    @IBOutlet weak var transportationImage: UIImageView!
    
    @IBOutlet weak var calculateOutlet: UIButton!
    
    var timeMultiplier = 1 //for the monthly button
    var averageSpeed = 20 //default for car
    var additionalTime = 0 //so that we can handle the extra 5 minutes calculation
    
    @IBAction func monthlySwitch(sender: UISwitch) {
        if (sender.on) {
            timeMultiplier = 20
            calculateButton(calculateOutlet)
        } else {
            timeMultiplier = 1
            calculateButton(calculateOutlet)
            
        }
        
    }
    
    //change mode of transportation based upon the Segment selector
    @IBAction func vehicleSegment(sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 1) { //bus
            averageSpeed = 12
            additionalTime = 5
            transportationImage.image = UIImage(named: "bus_icon")
        } else if (sender.selectedSegmentIndex == 2) { //bike
            averageSpeed = 10
            additionalTime = 0
            transportationImage.image = UIImage(named: "bike_icon")
        } else { //car
            averageSpeed = 20
            additionalTime = 0
            transportationImage.image = UIImage(named: "car_icon")
        }
        calculateButton(calculateOutlet)
    }
    
    
    //if mileage is over 50, send the user an alert on "Calculate" click
    func sendAlert() {
        let alertController = UIAlertController(title: "overMileage", message: "Your commute is over 50 miles! Consider moving closer", preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancelAction = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    //retrieve value from "roundTrip" textField and do operations on that float
    @IBAction func calculateButton(sender: UIButton) {
        
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        let roundTrip = (roundTripMiles.text).floatValue
        
        if (roundTrip > 50) {
            sendAlert()
        }
        
        let commuteResult = (roundTrip / Float(averageSpeed)) * Float(60)
        let gasResult = roundTrip / Float(24)
        
        commuteTime.text = numberFormatter.stringFromNumber(commuteResult * Float(timeMultiplier) + Float(additionalTime))! + " minutes"
        
        gasToPurchase.text = numberFormatter.stringFromNumber(gasResult * Float(timeMultiplier))! + " gallons"
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

