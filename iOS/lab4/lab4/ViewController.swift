//
//  ViewController.swift
//  lab4
//
//  Created by Dawson Botsford on 10/6/15.
//  Copyright © 2015 Dawson Botsford. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var delta = CGPointMake(12, 4)
    var ballRadius = CGFloat()
    var timer = NSTimer()
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var sliderLabel: UILabel!
    
    @IBAction func sliderMoved(sender: AnyObject) {
        timer.invalidate()
        changeSliderView()
    }
    
    func moveImage() {
        imageView.center = CGPointMake(imageView.center.x + delta.x, imageView.center.y + delta.y)
        
        if imageView.center.x > view.bounds.size.width - ballRadius || imageView.center.x < ballRadius {
            delta.x = -delta.x
        }
        if imageView.center.y > view.bounds.size.height - ballRadius || imageView.center.y < ballRadius {
            delta.y = -delta.y
        }
    }
    
    func changeSliderView() {
        sliderLabel.text = String(format: "%.2f", slider.value)
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(slider.value), target: self, selector: "moveImage", userInfo: nil, repeats: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ballRadius = imageView.frame.size.width/2
        changeSliderView()
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

