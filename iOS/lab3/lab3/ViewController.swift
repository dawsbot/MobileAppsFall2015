//
//  ViewController.swift
//  lab3
//
//  Created by Dawson Botsford on 9/22/15.
//  Copyright © 2015 Dawson Botsford. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var yourName: UITextField!
    @IBOutlet var yourAge: UITextField!
    
    @IBAction func alertMe(sender: UIButton) {
        let age = Float(yourAge.text!)
        let name = String(yourName.text!)
        let yourMessage = "Dogified " + name + " is " + String(age! * 10.5) + " years old"
        
        let alert = UIAlertController(title: "Age", message: yourMessage, preferredStyle: UIAlertControllerStyle.Alert)
        
        let cancelAction = UIAlertAction(title: "Okay Dokey",
            style:UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        
        yourAge.delegate = self
        yourName.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

