//
//  ViewController.swift
//  Bfriendly
//
//  Created by Dawson Botsford on 9/29/15.
//  Copyright © 2015 Dawson Botsford. All rights reserved.
//
// Learned contact saving from the turorial: http://www.appcoda.com/ios-contacts-framework/


import UIKit
import Contacts

func getAppDelegate() -> AppDelegate {
    return UIApplication.sharedApplication().delegate as! AppDelegate
}
/*
class func sharedDelegate() -> AppDelegate {
    return UIApplication.sharedApplication().delegate as! AppDelegate
}*/

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var firstIcon: UIButton!
    
    @IBOutlet var nameField: UITextField!
    @IBOutlet var emailField: UITextField!
    @IBOutlet var phoneNumberField: UITextField!
    
    @IBAction func bfriendButton(sender: UIButton) {
        //get text from all three briend fields
        
        
        //save new contact to common address book
        
        
        //alert user of saved contact
    }
    
    
    var store = CNContactStore()
    
    
    func checkAccessStatus(completionHandler: (accessGranted: Bool) -> Void) {
        let authorizationStatus = CNContactStore.authorizationStatusForEntityType(CNEntityType.Contacts)
        
        switch authorizationStatus {
        case .Authorized:
            completionHandler(accessGranted: true)
        case .Denied, .NotDetermined:
            self.store.requestAccessForEntityType(CNEntityType.Contacts, completionHandler: { (access, accessError) -> Void in
                if access {
                    completionHandler(accessGranted: access)
                } else {
                    print("access denied")
                }
            })
        default:
            completionHandler(accessGranted: false)
        }
    }
    /*
    class func sharedDelegate() -> AppDelegate {
        return UIApplication.sharedApplication().delegate as! AppDelegate
    }*/
    
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
        
        //check for contacts permissions
        checkAccessStatus({ (accessGranted) -> Void in
            print(accessGranted)
        })

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

