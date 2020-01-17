//
//  ResultsViewController.swift
//  Tippage
//
// Created by Frank Mohan on 12/27/2019.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tipValue: String?
    var split: Int?
    var percentage: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(tipValue == "nan"){
            totalLabel.text = "0.0"
            settingsLabel.text = "Did you forget to enter the total bill?"
        }else{
            totalLabel.text = tipValue
            settingsLabel.text = "Split between \(split!) people with \(percentage!)% tip."
        }
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
