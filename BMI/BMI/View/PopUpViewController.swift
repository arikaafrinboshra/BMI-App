//
//  PopUpViewController.swift
//  BMI
//
//  Created by Arika Afrin Boshra on 18/4/20.
//  Copyright © 2020 Arika Afrin Boshra. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    //Otlets
    @IBOutlet weak var popUpImage: UIImageView!
    @IBOutlet weak var popView: UIView!
    @IBOutlet weak var expectedBMIcontent: UITextView!
    @IBOutlet weak var currentBMIcontent: UITextView!
    @IBOutlet weak var okayBtn: UIButton!
    
    @IBAction func okayBtnAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //Variables
    var age: Double = 0.0
    var gender = ""
    var bmi: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expectedBMIcontent.backgroundColor = .white
        currentBMIcontent.backgroundColor = .white
        
        popView.layer.cornerRadius = 30
        
        okayBtn.layer.cornerRadius = 40
        okayBtn.layer.borderWidth = 2
        okayBtn.layer.borderColor = UIColor.white.cgColor
        
        content()
        
        expectedBMIcontent.isEditable = false
        currentBMIcontent.isEditable = false
        
    }
    
    func content() {
        
        popUpImage.image = UIImage(named: "unnamed-2")
        
        if age >= 19.0 && age <= 24.0 {
            expectedBMIcontent.text = "According to your age, your BMI range should be 19 to 24."
            
            if bmi >= 19.0 && bmi <= 24.0 {
                currentBMIcontent.text = "You are Healthy. Your BMI is normal."
                popUpImage.image = UIImage(named: "unnamed")
            }
            else if bmi < 19.0 {
                currentBMIcontent.text = "Your BMI is not normal. You are underweight."
            }
            else if bmi > 24.0 {
                currentBMIcontent.text = "Your BMI is not normal. You are overweight."
            }
            else {
                currentBMIcontent.text = "Something went wrong. Check your details and try again."
            }
        }
        else if age >= 25.0 && age <= 34.0 {
            expectedBMIcontent.text = "According to your age, your BMI range should be 20 to 25."
            
            if bmi >= 20.0 && bmi <= 25.0 {
                currentBMIcontent.text = "You are Healthy. Your BMI is normal."
                popUpImage.image = UIImage(named: "unnamed")
            }
            else if bmi < 20.0 {
                currentBMIcontent.text = "Your BMI is not normal. You are underweight."
            }
            else if bmi > 25.0 {
                currentBMIcontent.text = "Your BMI is not normal. You are overweight."
            }
            else {
                currentBMIcontent.text = "Something went wrong. Check your details and try again."
            }
        }
        else if age >= 35.0 && age <= 44.0 {
            expectedBMIcontent.text = "According to your age, your BMI range should be 21 to 26."
            
            if bmi >= 21.0 && bmi <= 26.0 {
                currentBMIcontent.text = "You are Healthy. Your BMI is normal."
                popUpImage.image = UIImage(named: "unnamed")
            }
            else if bmi < 21.0 {
                currentBMIcontent.text = "Your BMI is not normal. You are underweight."
            }
            else if bmi > 26.0 {
                currentBMIcontent.text = "Your BMI is not normal. You are overweight."
            }
            else {
                currentBMIcontent.text = "Something went wrong. Check your details and try again."
            }
        }
        else if age >= 45.0 && age <= 54.0 {
            expectedBMIcontent.text = "According to your age, your BMI range should be 22 to 27."
            
            if bmi >= 22.0 && bmi <= 27.0 {
                currentBMIcontent.text = "You are Healthy. Your BMI is normal."
                popUpImage.image = UIImage(named: "unnamed")
            }
            else if bmi < 22.0 {
                currentBMIcontent.text = "Your BMI is not normal. You are underweight."
            }
            else if bmi > 27.0 {
                currentBMIcontent.text = "Your BMI is not normal. You are overweight."
            }
            else {
                currentBMIcontent.text = "Something went wrong. Check your details and try again."
            }
        }
        else if age >= 55.0 && age <= 64.0 {
            expectedBMIcontent.text = "According to your age, your BMI range should be 23 to 28."
            
            if bmi >= 23.0 && bmi <= 28.0 {
                currentBMIcontent.text = "You are Healthy. Your BMI is normal."
                popUpImage.image = UIImage(named: "unnamed")
            }
            else if bmi < 23.0 {
                currentBMIcontent.text = "Your BMI is not normal. You are underweight."
            }
            else if bmi > 28.0 {
                currentBMIcontent.text = "Your BMI is not normal. You are overweight."
            }
            else {
                currentBMIcontent.text = "Something went wrong. Check your details and try again."
            }
        }
        else {
            expectedBMIcontent.text = "According to your age, you should not use this calculator."
            currentBMIcontent.text = "Please check the information page. Thank you."
        }
    }
}

