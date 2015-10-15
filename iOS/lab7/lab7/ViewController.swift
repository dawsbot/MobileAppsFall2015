//
//  ViewController.swift
//  lab7
//
//  Created by Dawson Botsford on 10/15/15.
//  Copyright © 2015 Dawson Botsford. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate{

    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    let fileName = "audio.caf"
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func recordAction(sender: AnyObject) {
        if audioRecorder?.recording == false {
            playButton.enabled = false
            stopButton.enabled = true
            audioRecorder?.record()
            
        }
    }
    
    @IBAction func playAction(sender: AnyObject) {
        if audioRecorder?.recording == false{
            stopButton.enabled = true
            recordButton.enabled = false
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOfURL: (audioRecorder?.url)!)
                
                audioPlayer?.delegate = self
                audioPlayer?.play()
                    

            } catch let error {
                print("AVAudioPlayer error: \(error)")
            }
            
        }
    }
    
    @IBAction func stopAction(sender: AnyObject) {
        stopButton.enabled = false
        playButton.enabled = true
        recordButton.enabled = true
        if audioRecorder?.recording == true {
            audioRecorder?.stop()
        } else {
            audioPlayer?.stop()
        }
    }
    
    
    override func viewDidLoad() {
        playButton.enabled = false
        stopButton.enabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        let docDir = dirPath[0] 
        let audioFilePath = docDir.stringByAppendingString(fileName)
        
        let audioFileURL = NSURL(fileURLWithPath: audioFilePath)
    
        let recordSettings = [AVEncoderAudioQualityKey: AVAudioQuality.Min.rawValue, AVEncoderBitRateKey: 16, AVNumberOfChannelsKey: 2, AVSampleRateKey: 44100.0]
        let error: NSError!
        //audioRecorder = AVAudioRecorder(URL: <#T##NSURL#>, settings: <#T##[String : AnyObject]#>),
        do {
            audioRecorder=try AVAudioRecorder(URL: audioFileURL, settings: recordSettings as! [String : AnyObject])
            audioRecorder?.delegate = self
            audioRecorder?.meteringEnabled = true
            audioRecorder?.prepareToRecord()
            
        }
        catch let error {
            audioRecorder = nil
            print(error)
            
        }
        //audioRecorder = AVAudioRecorder(URL: audioFileURL, settings: recordSettings as! [String: AnyObject], error: &error)
        
        /*
        if let err = error {
            print("AVAudioRecorder error: \(err.localizedDescription)")
        } else {
            audioRecorder?.delegate = self
            audioRecorder?.prepareToRecord()
        }*/
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

