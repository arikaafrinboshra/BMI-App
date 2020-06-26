//
//  ViewController.swift
//  BMI
//
//  Created by Arika Afrin Boshra on 28/2/20.
//  Copyright © 2020 Arika Afrin Boshra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var bmiView: UIView!
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var heightTextFieldFoot: UITextField!
    @IBOutlet weak var heightTextFieldFootInch: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var bmiButton: UIButton!
    
    @IBOutlet weak var metre: UIImageView!
    @IBOutlet weak var pointer2: UIImageView!
    @IBOutlet weak var pointer11: UIImageView!
    @IBOutlet weak var pointer12: UIImageView!
    @IBOutlet weak var pointer13: UIImageView!
    @IBOutlet weak var pointer31: UIImageView!
    @IBOutlet weak var pointer32: UIImageView!
    @IBOutlet weak var pointer33: UIImageView!
    @IBOutlet weak var defaultPointer: UIImageView!
    
    @IBOutlet var bmiLabel: UILabel!
    
    @IBOutlet weak var selectUnitOfHeight: UITextField!
    @IBOutlet weak var selectUnitOfWeight: UITextField!
    
    @IBOutlet weak var infoBtn: UIButton!
    
    //variables
    var ageUse: String?
    var genderUse: String?
    var heightUnitUse: String?
    var weightUnitUse: String?
    
    //Picker Views
    let genderPickerView = UIPickerView()
    let selectUnitOfHeightPickerView = UIPickerView()
    let selectUnitOfWeightPickerView = UIPickerView()
    
    let imageNameArray = ["pointer2",
                          "pointer11",
                          "pointer12",
                          "pointer13",
                          "pointer31",
                          "pointer32",
                          "pointer33",
                          "defaultPointer"]
    //let imgArray: [UIImage] = [#imageLiteral(resourceName: "pointer2"),#imageLiteral(resourceName: "pointer12"),#imageLiteral(resourceName: "pointer12"),#imageLiteral(resourceName: "pointer13"),#imageLiteral(resourceName: "pointer31"),#imageLiteral(resourceName: "pointer32"),#imageLiteral(resourceName: "pointer33"),#imageLiteral(resourceName: "defaultPointer")]
    //let image = UIImage(named: "pointer2")
    
    let unitOfHeignt: [String] = ["Meter",
                                  "Foot",
                                  "Inch",
                                  "Centimeter"]
    
    let unitOfWeight: [String] = ["Lbs",
                                  "Kg"]
    
    let gender: [String] = ["Male",
                            "Female"]
    
    //Actions
    @IBAction func realoadBtn(_ sender: Any) {
        
        ageTextField.text = ""
        genderTextField.text = ""
        heightTextField.text = ""
        heightTextFieldFoot.text = ""
        heightTextFieldFootInch.text = ""
        weightTextField.text = ""
        selectUnitOfHeight.text = ""
        selectUnitOfWeight.text = ""
        
        bmiLabel.text = "0.00"
        
        metre.isHidden = false
        defaultPointer.isHidden = true
        pointer2.isHidden = true
        pointer11.isHidden = true
        pointer12.isHidden = true
        pointer13.isHidden = true
        pointer31.isHidden = true
        pointer32.isHidden = true
        pointer33.isHidden = true
        
    }
    
    //hide text box when "foot" is selected
    @IBAction func selectUnitHeightForFootAction(_ sender: Any) {
        
        if (selectUnitOfHeight.text == "Foot") {
            heightTextFieldFoot.text = ""
            heightTextFieldFootInch.text = ""
            heightTextField.isHidden = true
            heightTextFieldFoot.isHidden = false
            heightTextFieldFootInch.isHidden = false
        }
        else {
            heightTextField.text = ""
            heightTextField.isHidden = false
            heightTextFieldFoot.isHidden = true
            heightTextFieldFootInch.isHidden = true
        }
        
    }
    
    @IBAction func bmiButtonAction(_ sender: Any) {
        
        let w = Double(weightTextField.text!)
        let text: Double
        
        if heightTextFieldFoot.hasText &&
            heightTextFieldFootInch.hasText &&
            ageTextField.hasText &&
            genderTextField.hasText &&
            weightTextField.hasText &&
            selectUnitOfHeight.text == "Foot" {
            
            let h1 = Double(heightTextFieldFoot.text!)
            let h2 = Double(heightTextFieldFootInch.text!)
            text = bmiCalculationFoot(height1: h1!,height2: h2!, weight: w!)
            
            self.bmiLabel.text = String(format: "%.1f", text)
            setPointer(bmiValue: text)
            performSegue(withIdentifier: "popUp", sender: self)
            
            //auto scroll on button click
            UIView.animate(withDuration: 3, animations: {self.scrollView.contentOffset = CGPoint(x: 0, y: 510)})
        }
        else if heightTextField.hasText &&
            ageTextField.hasText &&
            genderTextField.hasText &&
            weightTextField.hasText &&
            selectUnitOfHeight.text != "Foot" {
            
            let h = Double(heightTextField.text!)
            text = bmiCalculation(height: h!, weight: w!)
            
            self.bmiLabel.text = String(format: "%.1f", text)
            setPointer(bmiValue: text)
            performSegue(withIdentifier: "popUp", sender: self)
            
            //auto scroll on button click
            UIView.animate(withDuration: 3, animations: {self.scrollView.contentOffset = CGPoint(x: 0, y: 510)})
        }
        else { alart() }
        
    }
    
    func alart() {
        let alert = UIAlertController(title: "All details required", message: "You can not contuinue without it.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
            (action:UIAlertAction!) in }))
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTextFields()
        textFieldUnderLine()
        bmiButtonDesign()
        picker()
        toolBar()
        dismissKey()
        
        metre.isHidden = false
        defaultPointer.isHidden = true
        pointer2.isHidden = true
        pointer11.isHidden = true
        pointer12.isHidden = true
        pointer13.isHidden = true
        pointer31.isHidden = true
        pointer32.isHidden = true
        pointer33.isHidden = true
    }
    
    func setUpTextFields() {
        
        ageTextField.delegate = self
        genderTextField.delegate = self
        heightTextField.delegate = self
        weightTextField.delegate = self
        heightTextFieldFoot.delegate = self
        heightTextFieldFootInch.delegate = self
        
        heightTextFieldFootInch.isHidden = true
        heightTextFieldFoot.isHidden = true
        
    }
    
    func bmiCalculation( height: Double,weight: Double) -> Double {
        
        var h = height
        var w = weight
        heightUnitUse = selectUnitOfHeight.text
        weightUnitUse = selectUnitOfWeight.text
        
        if (heightUnitUse == "Inch")        {h /= 39.37}
        if (heightUnitUse == "Centimeter")  {h /= 100}
        if (weightUnitUse == "Lbs")         {w = w/2.205}
        
        // bmi = kg/m2
        return (w/(h*h))
    }
    
    func bmiCalculationFoot( height1: Double, height2: Double, weight: Double) -> Double {
        
        var h1 = height1
        let h2 = height2
        var w = weight
        weightUnitUse = selectUnitOfWeight.text
        
        if (weightUnitUse == "Lbs")         {w = w/2.205}
        
        h1 = ((h1*12)+h2)/39.37
        
        return (w/(h1*h1))
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "info"{
            _ = segue.destination as! InfoViewController
        }
        else if segue.identifier == "popUp" {
            
            if heightTextFieldFoot.hasText &&
                heightTextFieldFootInch.hasText &&
                ageTextField.hasText &&
                genderTextField.hasText &&
                weightTextField.hasText &&
                selectUnitOfHeight.text == "Foot" {
                
                let vc = segue.destination as! PopUpViewController
                vc.age = Double(ageTextField.text!)!
                vc.gender = genderTextField.text!
                vc.bmi = Double(bmiLabel.text!)!
                
            }
            else if heightTextField.hasText &&
                ageTextField.hasText &&
                genderTextField.hasText &&
                weightTextField.hasText &&
                selectUnitOfHeight.text != "Foot" {
                
                let vc = segue.destination as! PopUpViewController
                vc.age = Double(ageTextField.text!)!
                vc.gender = genderTextField.text!
                vc.bmi = Double(bmiLabel.text!)!
            }
            else {}
        }
    }
}

//Tap anywhere in the screen to dismiss keyboard
extension UIViewController {
    func dismissKey()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
