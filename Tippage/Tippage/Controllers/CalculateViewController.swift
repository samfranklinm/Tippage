//
//  ViewController.swift
//  Tippage
//
//  Created by Frank Mohan on 12/27/2019.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var totalTipValue = "0.0"
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var myStepper: UIStepper!
    
    @IBOutlet weak var customTipLabel: UILabel!
    
    @IBAction func sliderUsed(_ sender: UISlider) {
        
        customTipLabel.text = String(format: "%.0f", sender.value)
        
    }
    
    var totalBill: Float = 0.0
    var tipPct: Float = 0.0
    var tip: Int = 0
    
    var splitNum: Float = 1.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myStepper.value = Double(splitNum)
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))

        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false

        view.addGestureRecognizer(tap)
    }

    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func tipChanged(_ sender: UIButton){
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        if(tenPctButton.isSelected){
            tipPct = 0.1
            tip = 10
        }else if(twentyPctButton.isSelected){
            tipPct = 0.2
            tip = 20
        }else{
            tipPct = 0.0
            tip = 0
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func totalBillEntered(_ sender: UITextField) {
        if(billTextField.text != ""){
            totalBill = Float(sender.text!)!
        }
        billTextField.becomeFirstResponder()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper){

        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitNum = Float((sender.value))
        billTextField.endEditing(true)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton){
        let totalTipAmount = ((totalBill/splitNum) + ((totalBill/splitNum)*tipPct))
        totalTipValue = String(format: "%.2f", totalTipAmount)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    } 
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tipValue = totalTipValue
            destinationVC.split = Int(splitNum)
            destinationVC.percentage = tip
        }
    }
    
    
}

