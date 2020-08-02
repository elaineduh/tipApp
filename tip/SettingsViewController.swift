//
//  SettingsViewController.swift
//  tip
//
//  Created by Elaine Duh on 8/1/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultAmountControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Maintains selection of previously selected default tip
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Get default tip percentage from UserDefaults
        let defaults = UserDefaults.standard
        let defaultIdx = defaults.integer(forKey: "defaultPercentIdx")
        
        // Update the tip amount
        defaultAmountControl.selectedSegmentIndex = defaultIdx
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        // Get default percentage on change
        let defaultPercentIdx = defaultAmountControl.selectedSegmentIndex
        
        // Access UserDefaults
        let defaults = UserDefaults.standard
        
        // Set default value
        defaults.set(defaultPercentIdx, forKey: "defaultPercentIdx")
        
        // Force UserDefaults to Save
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
