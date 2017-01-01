//
//  ViewController.swift
//  MyTipCalcualtor
//
//  Created by Sylvia Mach on 12/31/16.
//  Copyright © 2016 Sylvia Mach. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitTotalLabel: UILabel!
    @IBOutlet weak var splitTipLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var splitControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.billTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let defaultTip = defaults.double(forKey: "defaultTip")
        
        if defaultTip == 0.15{
            tipControl.selectedSegmentIndex = 0
        }
        else if defaultTip == 0.2{
            tipControl.selectedSegmentIndex = 1
        }
        else{
            tipControl.selectedSegmentIndex = 2
        }
        calculateTip(tipControl)
        
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

    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.15, 0.2, 0.25]
        let peopleSplit = [1.0, 2.0, 3.0, 4.0, 5.0]
        
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        let splitTotal = total/peopleSplit[splitControl.selectedSegmentIndex]
        let splitTip = tip/peopleSplit[splitControl.selectedSegmentIndex]
        
        splitTotalLabel.text = String(format: "$%.2f", splitTotal)
        splitTipLabel.text = String(format: "$%.2f", splitTip)
    }
}

