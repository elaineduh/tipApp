//
//  ViewController.swift
//  tip
//
//  Created by Elaine Duh on 8/1/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Open keyboard on default
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Get default tip percentage from UserDefaults
        let defaultIdx = defaults.integer(forKey: "defaultPercentIdx")

        // Update the tip amount
        tipControl.selectedSegmentIndex = defaultIdx
        
        // Get bill amount if less than 10 minutes ago
        let currentTime = NSDate()
        let lastTime = defaults.object(forKey: "lastTime")
        let tenMin = TimeInterval(60 * 10)
        
        // Set bill amount if less than 10 minutes ago
        if (currentTime.timeIntervalSince(lastTime as! Date) < tenMin) {
            print("Hello")
            let billAmount = defaults.double(forKey: "billAmount")
            billField.text = String(billAmount)
        }
        
        // Update tip labels/recalculate
        updateTipLabels()
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        updateTipLabels()
    }
    
    func updateTipLabels() {
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        // Remember the bill amount
        defaults.set(bill, forKey: "billAmount")
        
        // Record time
        let currentTime = Date()
        defaults.set(currentTime, forKey: "lastTime")
    }
    
}

