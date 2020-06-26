//
//  PointerCondition.swift
//  BMI
//
//  Created by Arika Afrin Boshra on 9/4/20.
//  Copyright © 2020 Arika Afrin Boshra. All rights reserved.
//

import UIKit

extension ViewController {
    
    func setPointer (bmiValue: Double) {
        
        metre.isHidden = false
        defaultPointer.isHidden = true
        pointer2.isHidden = true
        pointer11.isHidden = true
        pointer12.isHidden = true
        pointer13.isHidden = true
        pointer31.isHidden = true
        pointer32.isHidden = true
        pointer33.isHidden = true
        
        if (bmiValue < 16) {
            defaultPointer.isHidden = false
        }
        if (bmiValue >= 16 && bmiValue <= 17) {
            pointer12.isHidden = false
        }
        if (bmiValue > 17 && bmiValue <= 18.5) {
            pointer13.isHidden = false
        }
        if (bmiValue > 18.5 && bmiValue <= 25) {
            pointer2.isHidden = false
        }
        if (bmiValue > 25 && bmiValue <= 30) {
            pointer31.isHidden = false
        }
        if (bmiValue > 30 && bmiValue <= 35) {
            pointer32.isHidden = false
        }
        if (bmiValue > 35) {
            pointer33.isHidden = false
        }
    }
}
