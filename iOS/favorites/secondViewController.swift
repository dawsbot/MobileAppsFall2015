//
//  secondViewController.swift
//  favorites
//
//  Created by Dawson Botsford on 10/20/15.
//  Copyright © 2015 Dawson Botsford. All rights reserved.
//

import UIKit

class secondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userBook: UITextField!
    @IBOutlet weak var userAuthor: UITextField!
  
    override func viewDidLoad() {
        userBook.delegate=self
        userAuthor.delegate=self
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "doneFavs"{
            var scene1ViewController:ViewController =
            segue.destinationViewController as! ViewController
            //check to see that text was entered in the textfields
            if userBook.text!.isEmpty == false{
                scene1ViewController.user.firstName=userBook.text
            }
            if userAuthor.text!.isEmpty == false{
                scene1ViewController.user.lastName=userAuthor.text
            }
        }
    }
    

}
