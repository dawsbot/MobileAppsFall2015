//
//  ViewController.swift
//  animation
//  Dawson Botsford

import UIKit

class ViewController: UIViewController {
    
    var delta = CGPointMake(0.0, 12) //initialize the delta to move 0 pixels horizontally, 10 pixels vertically
    var ballRadius = CGFloat() //radius of the ball image
    var timer = NSTimer() //animation timer
    var translation = CGPointMake(0.0, 0.0) //specifies how many pixels the image will move
    var angle:CGFloat=0.0 //roation angle
    var reboundRate:CGFloat = 1.0
    var spinIt = true
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func sliderMoved(sender: UISlider) {
        timer.invalidate()
        changeSliderValue()
    }
    
    //changes the position of the image view
    func moveImage() {
        let duration=Double(slider.value)
        UIView.beginAnimations("bball", context: nil)
       
        if (spinIt) {
            UIView.animateWithDuration(duration, animations:
                {self.imageView.transform=CGAffineTransformMakeRotation(self.angle)
                    self.imageView.center = CGPointMake(self.imageView.center.x + self.delta.x, self.imageView.center.y + self.delta.y)
            })
            UIView.commitAnimations()
        }
        angle += 0.07 //amount you increase the angle
        //if it's a full rotation reset the angle
        if angle > CGFloat(2*M_PI){
            angle=0
        }
        delta.y += 0.7
        if imageView.center.x > self.view.bounds.size.width-ballRadius || imageView.center.x < ballRadius{
            delta.x = -delta.x
        }
        if imageView.center.y  > self.view.bounds.size.height - ballRadius || imageView.center.y  < ballRadius {
            delta.y = -delta.y
            if (delta.y < 0) {
                delta.y += 2;
            }
            if (abs(delta.y) < 3) {
                delta.y = 0
                spinIt = false
            }
        }
    }
    
    //updates the timer and label with the current slider value
    @IBAction func changeSliderValue() {
        sliderLabel.text=String(format: "%.2f", slider.value)
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(slider.value / 34), target: self, selector: "moveImage", userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        //ball radius is half the width of the image
        ballRadius=imageView.frame.size.width/2
        changeSliderValue()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

