//
//  PickerView.swift
//  BMI
//
//  Created by Arika Afrin Boshra on 9/4/20.
//  Copyright © 2020 Arika Afrin Boshra. All rights reserved.
//

import UIKit

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func picker() {
        
        genderPickerView.delegate = self
        selectUnitOfHeightPickerView.delegate = self
        selectUnitOfWeightPickerView.delegate = self
        
        genderTextField.inputView = genderPickerView
        selectUnitOfHeight.inputView = selectUnitOfHeightPickerView
        selectUnitOfWeight.inputView = selectUnitOfWeightPickerView
        
        
        
        genderPickerView.backgroundColor = .white
        selectUnitOfHeightPickerView.backgroundColor = .white
        selectUnitOfWeightPickerView.backgroundColor = .white
    }
    
    func toolBar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        toolBar.barTintColor = .white
        toolBar.tintColor = .black
        
        selectUnitOfHeight.inputAccessoryView = toolBar
        selectUnitOfWeight.inputAccessoryView = toolBar
        genderTextField.inputAccessoryView = toolBar
    }
    
    @objc override func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if (pickerView == genderPickerView) {
            return gender.count
        }
        if (pickerView == selectUnitOfHeightPickerView) {
            return unitOfHeignt.count
        }
        if (pickerView == selectUnitOfWeightPickerView) {
            return unitOfWeight.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == genderPickerView) {
            return gender[row]
        }
        if (pickerView == selectUnitOfHeightPickerView) {
            return unitOfHeignt[row]
        }
        if (pickerView == selectUnitOfWeightPickerView) {
            return unitOfWeight[row]
        }
        
        return ""
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if (pickerView == genderPickerView) {
            genderTextField.text = gender[row]
        }
        if (pickerView == selectUnitOfHeightPickerView) {
            selectUnitOfHeight.text = unitOfHeignt[row]
        }
        if (pickerView == selectUnitOfWeightPickerView) {
            selectUnitOfWeight.text = unitOfWeight[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        if (pickerView == genderPickerView) {
            
            return NSAttributedString(string: gender[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        }
        
        if (pickerView == selectUnitOfHeightPickerView) {
            
            return NSAttributedString(string: unitOfHeignt[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        }
        
        if (pickerView == selectUnitOfWeightPickerView) {
            
            return NSAttributedString(string: unitOfWeight[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        }
        
        return nil
    }

}

