//
//  ViewController.swift
//  Bfriendly
//
//  Created by Dawson Botsford on 9/29/15.
//  Copyright © 2015 Dawson Botsford. All rights reserved.
//

import UIKit
import AddressBook

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var firstIcon: UIButton!
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneNumberField: UITextField!
    
    //Request address book access
    //let authorizationStatus = ABAddressBookGetAuthorizationStatus()
    let authorizationStatus = ABAddressBookGetAuthorizationStatus()
    
    
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Close keyboard via "return"
        self.nameField.delegate = self;
        self.emailField.delegate = self;
        self.phoneNumberField.delegate = self;
        
        // Close keyboard via screen tap
        let tap = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
        
        switch authorizationStatus {
        case .Denied, .Restricted:
            //1
            print("Denied")
        case .Authorized:
            //2
            print("Authorized")
        case .NotDetermined:
            //3
            print("Not Determined")
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

}

