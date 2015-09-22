//
//  ViewController.swift
//  lab2
//
//  Created by Dawson Botsford on 9/21/15.
//  Copyright © 2015 Dawson Botsford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var blackBox: UIImageView!
    var blackBoxWidth: CGFloat = 0.0
    @IBOutlet var mySlider: UISlider!
    
    @IBAction func colorPicker(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            blackBox.backgroundColor = UIColor.blackColor()
        } else {
            blackBox.backgroundColor = UIColor.redColor()
        }
    }
    
    
    @IBAction func changeWidth(sender: UISlider) {
        var frm = blackBox.frame
        
        blackBox.frame = frm
        
        frm.size.width = blackBoxWidth * CGFloat(mySlider.value)
        blackBox.frame = frm
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blackBoxWidth = blackBox.frame.size.width
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

