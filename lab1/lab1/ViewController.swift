//
//  ViewController.swift
//  lab1
//
//  Created by Dawson Botsford on 9/1/15.
//  Copyright (c) 2015 Dawson Botsford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var HackathonLogo: UIImageView!
 
    @IBAction func chooseHackathon(sender: UIButton) {
        if sender.tag == 1 {
            HackathonLogo.image = UIImage(named: "HackCU.png")
            messageText.text = "Boulder, CO"
        } else if sender.tag == 2 {
            HackathonLogo.image = UIImage(named: "HackGT.png")
            messageText.text = "Atlanta, GA"
        } else {//sender.tag == 3
            HackathonLogo.image = UIImage(named: "MHacks.png")
            messageText.text = "Ann Arbor, MI"
        }
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

