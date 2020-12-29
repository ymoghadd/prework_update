//
//  ViewController.swift
//  prework_updated
//
//  Created by Yasamin Moghaddas on 12/23/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentages = [0.15, 0.18, 0.2]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

// It's a life cycle method. It's called everytime the view appears. Everytime you come back to it. Different from viewDidLoad because viewDidLoad is only called once and that is when it's instantiated.
    override func viewWillAppear(_ animated: Bool) {
// UserDefaults is a dictionary to store persistent data (as in you close the app and then it saves the data). UserDefaults is like dictionary.
        let defaults = UserDefaults.standard
        tipPercentages[0] = Double(defaults.string(forKey: "tipPercentage1") ?? "0") ?? 0.15
        tipPercentages[1] = Double(defaults.string(forKey: "tipPercentage2") ?? "0") ?? 0.18
        tipPercentages[2] = Double(defaults.string(forKey: "tipPercentage3") ?? "0") ?? 0.2
        print(defaults.string(forKey: "tipPercentage1"))
        tipControl.setTitle(defaults.string(forKey: "tipPercentage1"), forSegmentAt: 0)
        tipControl.setTitle(defaults.string(forKey: "tipPercentage2"), forSegmentAt: 1)
        tipControl.setTitle(defaults.string(forKey: "tipPercentage3"), forSegmentAt: 2)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let settingsvc = segue.destination as! SettingsViewController
//        settingsvc.defaultTipPercentages = tipPercentages
//    }
//    @IBAction func changeTipPercentages(_ sender: Any) {
//        performSegue(withIdentifier: "linkscreens", sender: self)
//    }
    
}

