//
//  SettingsViewController.swift
//  prework_updated
//
//  Created by Yasamin Moghaddas on 12/24/20.
//

import UIKit

//protocol changeSettings {
//    func changeTipPercentages(number: Double, index: Int)
//}

class SettingsViewController: UIViewController {
    //var delegate: changeSettings? = nil
//    var defaultTipPercentages = [0.15, 0.18, 0.2]
    let defaults = UserDefaults.standard
//    let vc = ViewController()
//    func changeTipPercentages(number: String, index: Int) {
//        vc.tipPercentages[index] = Double(number) ?? 0.0
//    }
    @IBOutlet weak var tipPercentage1TextField: UITextField!
    @IBOutlet weak var tipPercentage2TextField: UITextField!
    @IBOutlet weak var tipPercentage3TextField: UITextField!
    
//    var settingsDelegate: changeSettings!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        tipPercentage1TextField.text = defaults.string(forKey: "tipPercentage1")
        tipPercentage2TextField.text = defaults.string(forKey: "tipPercentage2")
        tipPercentage3TextField.text = defaults.string(forKey: "tipPercentage3")
    }

    @IBAction func tipControl1(_ sender: Any) {
        defaults.setValue(tipPercentage1TextField.text, forKey: "tipPercentage1")
    }

    
    
//    override func viewWillDisappear(_ animated: Bool) {
//        defaults.setValue(tipPercentage1TextField.text, forKey: "tipPercentage1")
//        print(defaults.string(forKey: "tipPercentage1"))
//    }
    
// Similar to viewWillAppear but it happens everytime view is removed from stack. It's repeated in all the tipControls.
    override func viewWillDisappear(_ animated: Bool) {
        defaults.setValue(tipPercentage1TextField.text, forKey: "tipPercentage1")
        defaults.setValue(tipPercentage2TextField.text, forKey: "tipPercentage2")
        defaults.setValue(tipPercentage3TextField.text, forKey: "tipPercentage3")
    }
//Updates user defaults everytime user types in new data.
    @IBAction func tipControl2(_ sender: Any) {
        defaults.setValue(tipPercentage2TextField.text, forKey: "tipPercentage2")
    }
//
    @IBAction func tipControl3(_ sender: Any) {
        defaults.setValue(tipPercentage3TextField.text, forKey: "tipPercentage3")
        }
}
