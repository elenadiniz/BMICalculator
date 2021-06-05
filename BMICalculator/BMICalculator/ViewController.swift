//
//  ViewController.swift
//  BMICalculator
//
//  Created by Elena Diniz on 03/06/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var layoutColorSegment: UISegmentedControl!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calcButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.heightTextField.delegate = self
        self.weightTextField.delegate = self
        
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedCalcButton(_ sender: UIButton) {
        
        bmiCalc(firstValue: self.heightTextField.text ?? "", secondValue: self.weightTextField.text ?? "")
        
        }
        
    
    @IBAction func tappedLayoutSegment(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
            self.resultLabel.textColor = UIColor.darkGray
            self.infoLabel.textColor = UIColor.darkGray
        default:
            self.view.backgroundColor = UIColor.darkGray
            self.resultLabel.textColor = UIColor.white
            self.infoLabel.textColor = UIColor.white
        }
    }
    
    func bmiCalc(firstValue: String, secondValue: String) {
        
        let value1: Float = Float(firstValue) ?? 0
        let value2: Float = Float(secondValue) ?? 0
        
        let heightCalc = value1 * value1
        let weightCalc = value2 / heightCalc
        
        print(weightCalc)
        
        self.resultLabel.text = "Seu IMC é de: \(weightCalc)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.isEqual(heightTextField) {
            self.weightTextField.becomeFirstResponder()
        }else { self.weightTextField.resignFirstResponder()
                }
                return true
    }
}

