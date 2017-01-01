//
//  SettingsViewController.swift
//  MyTipCalcualtor
//
//  Created by Sylvia Mach on 12/31/16.
//  Copyright © 2016 Sylvia Mach. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var defaultTipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let selectedTip = defaults.double(forKey: "defaultTip")
        
        if selectedTip == 0.15{
            defaultTipControl.selectedSegmentIndex = 0
        }
        else if selectedTip == 0.2{
            defaultTipControl.selectedSegmentIndex = 1
        }
        else{
            defaultTipControl.selectedSegmentIndex = 2
        }

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    @IBAction func onChange(_ sender: AnyObject) {
        let tipPercentages = [0.15, 0.2, 0.25]
        let defaults = UserDefaults.standard
        
        defaults.set(tipPercentages[defaultTipControl.selectedSegmentIndex], forKey: "defaultTip")
    
        defaults.synchronize()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
