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
            HackathonLogo.image = UIImage(named: "Image-2.png")
            messageText.text = "Boulder, CO"
        } else {
            HackathonLogo.image = UIImage(named: "Image-1.png")
            messageText.text = "Atlanta, GA"
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

