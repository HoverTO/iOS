//
//  SignUpTwoViewController.swift
//  Hover
//
//  Created by Malik Ismail on 2017-02-15.
//  Copyright © 2017 Malik Ismail. All rights reserved.
//

import UIKit
import Alamofire

class SignUpTwoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var textFieldCompany: UITextField!
    
    @IBOutlet weak var textFieldPosition: UITextField!
    
    var company = ["Tesla", "IESO", "OPG", "Google", "Uber", "BCG"]
    var position = ["Analyst", "Associate", "Manager", "Senior Manager", "Vice President", "President", "CEO"]
    
    let picker = UIPickerView()
    let picker2 = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        picker2.delegate = self
        picker2.dataSource = self
        
        // binding text field to picker
        textFieldCompany.inputView = picker
        textFieldPosition.inputView = picker2

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) ->
        Int{
            
            if pickerView == picker {
                return company.count
            }
            else if pickerView == picker2 {
                return position.count
            }
            return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == picker {
            return company[row]
        }
        else if pickerView == picker2 {
            return position[row]
        }
        
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == picker {
            textFieldCompany.text = company[row]
            self.view.endEditing(false)
        }
        else if pickerView == picker2 {
            textFieldPosition.text = position[row]
            self.view.endEditing(false)
        }
    }
    
    
    @IBAction func ContinueButton(_ sender: Any) {
        let parameters: Parameters = [
            "company":textFieldCompany.text!,
            "position":textFieldPosition.text!,
        ]
        
        addUserData(user_id: "1", parameters: parameters)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
