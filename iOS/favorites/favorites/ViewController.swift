//
//  ViewController.swift
//  favorites
//
//  Dawson Botsford

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var user=Name()
    
    @IBAction func unwindSegue (segue:UIStoryboardSegue){
        bookLabel.text=user.firstName
        authorLabel.text=user.lastName
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

