//
//  ViewController.swift
//  tipCalculator
//
//  Created by Dawson Botsford on 9/17/15.
//  Copyright (c) 2015 Dawson Botsford. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var checkAmount: UITextField!
    @IBOutlet weak var tipPercent: UITextField!
    @IBOutlet weak var people: UITextField!
    
    @IBOutlet weak var tipDue: UILabel!
    @IBOutlet weak var totalDuePerPerson: UILabel!
    @IBOutlet weak var totalDue: UILabel!
    
    
    func updateTipTotal() {
        let amount = (checkAmount.text as NSString).floatValue
        let pct = (tipPercent.text as NSString).floatValue/100
        let numberOfPeople = people.text.toInt()
        let tip = amount * pct
        let total = amount + tip
        var personTotal : Float = 0.0
        if numberOfPeople != nil {
            if numberOfPeople! > 0 {
                personTotal = total / Float(numberOfPeople!)
            }
        }
        var currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        tipDue.text = currencyFormatter.stringFromNumber(tip)
        totalDue.text = currencyFormatter.stringFromNumber(total)
        totalDuePerPerson.text = currencyFormatter.stringFromNumber(personTotal)
    }
    
    func textFieldDidEndEditing(textField: UITextField){
        updateTipTotal()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkAmount.delegate = self
        tipPercent.delegate = self
        people.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

