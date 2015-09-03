//
//  ViewController.swift
//  helloWorld
//
//  Created by Dawson Botsford on 8/27/15.
//  Copyright (c) 2015 Dawson Botsford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var messageText: UILabel!
    
    var counter = 0
    
    @IBAction func buttonPressed(sender: UIButton) {
        counter++
        messageText.text = String(counter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageText.text = String(counter)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

