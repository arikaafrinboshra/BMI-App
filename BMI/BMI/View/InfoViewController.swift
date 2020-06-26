//
//  InfoViewController.swift
//  BMI
//
//  Created by Arika Afrin Boshra on 10/4/20.
//  Copyright © 2020 Arika Afrin Boshra. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    //Outlets
    @IBOutlet weak var introTextView: UITextView!
    @IBOutlet weak var restrictionTextView: UITextView!
    @IBOutlet weak var backBtn: UIButton!
    
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //Actions
    @IBAction func authenticityBtn(_ sender: Any) {
        if let url = NSURL(string: "https://www.ramsayhealth.co.uk/weight-loss-surgery/bmi/bmi-formula") {
            if UIApplication.shared.canOpenURL(url as URL) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url as URL)
                }
            }
        }
    }
    
    @IBAction func privacyPolicyBtn(_ sender: Any) {
        if let url = NSURL(string: "https://bit.ly/2BanpLG") {
            if UIApplication.shared.canOpenURL(url as URL) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
                } else {
                    UIApplication.shared.openURL(url as URL)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        introTextView.backgroundColor = .white
        restrictionTextView.backgroundColor = .white
        
        introTextView.text = "BMI is a measurement of a person's leanness or corpulence based on their height and weight, and is intended to quantify tissue mass. It is widely used as a general indicator of whether a person has a healthy body weight for their height. Specifically, the value obtained from the calculation of BMI is used to categorize whether a person is underweight, normal weight, overweight, or obese depending on what range the value falls between. These ranges of BMI vary based on factors such as region and age, and are sometimes further divided into subcategories such as severely underweight or very severely obese."
        
        restrictionTextView.text = "BMI is not used for muscle builders, long distance athletes, pregnant women, the elderly or young children. This is because BMI does not take into account whether the weight is carried as muscle or fat, just the number. Those with a higher muscle mass, such as athletes, may have a high BMI but not be at greater health risk. Those with a lower muscle mass, such as children who have not completed their growth or the elderly who may be losing some muscle mass may have a lower BMI."
        
        introTextView.isEditable = false
        restrictionTextView.isEditable = false

    }
    
}
