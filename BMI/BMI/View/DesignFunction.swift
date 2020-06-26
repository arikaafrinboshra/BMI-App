//
//  DesignFunction.swift
//  BMI
//
//  Created by Arika Afrin Boshra on 9/4/20.
//  Copyright © 2020 Arika Afrin Boshra. All rights reserved.
//

import UIKit

extension ViewController {
    
    func textFieldUnderLine () {
        ageTextField.setUnderLine()
        genderTextField.setUnderLine()
        heightTextField.setUnderLine()
        heightTextFieldFoot.setUnderLine()
        heightTextFieldFootInch.setUnderLine()
        weightTextField.setUnderLine()
        //selectUnitOfHeight.setUnderLine()
        //selectUnitOfWeight.setUnderLine()
    }
    
    func bmiButtonDesign() {
        bmiButton.layer.cornerRadius = 5
        bmiLabel.layer.cornerRadius = 5
        bmiLabel.layer.borderWidth = 1
        bmiLabel.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inverseSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let components = string.components(separatedBy: inverseSet)
        let filtered = components.joined(separator: "")
        
        if filtered == string {
            return true
        } else {
            if string == "." {
                let countdots = textField.text!.components(separatedBy:".").count - 1
                if countdots == 0 {
                    return true
                }else{
                    if countdots > 0 && string == "." {
                        return false
                    } else {
                        return true
                    }
                }
            }else{
                return false
            }
        }
    }
}

extension UITextField {
    
    func setUnderLine() {
        
        let border = CALayer()
        let width = CGFloat(0.5)
        
        border.borderColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
    }
    
}
