//
//  ViewController.swift
//  Testing App
//
//  Created by Arthur Yu on 4/12/16.
//  Copyright © 2016 Arthur Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var hiddenTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerConfiguration()
//        textFieldOutlet.inputAccessoryView = self.toolBarCreation()
        //hidePickerView()
        hiddenTextField.inputView = pickerView
        hiddenTextField.inputAccessoryView = toolBar
      
        self.selectCountrybutton.setTitle("🇺🇸 ⌵", forState:UIControlState.Normal)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    var pickerViewData = ["🇺🇸 United States of America", "🇨🇦 Canada"]
    
    @IBOutlet weak var selectCountrybutton: UIButton!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet weak var textFieldOutlet: UITextField!
    
    @IBAction func textFieldAction(sender: AnyObject) {
        
    }

    @IBAction func countryFlagClicked(sender: AnyObject) {
//        hiddenTextField.inputView = pickerView
//        hiddenTextField.inputAccessoryView = toolBar
        hiddenTextField.becomeFirstResponder()
//        self.view.addSubview(self.pickerView)
//        self.view.addSubview(self.toolBar)
//        guard (self.pickerView == nil) else {
//            self.showPickerView()
//            return
//        }
//        return
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func toolBarCreation() -> UIToolbar {
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ViewController.hidePickerView))
        toolBar.setItems([flexibleSpace, doneButton], animated: true)
        toolBar.userInteractionEnabled = true
        return toolBar
    }
    
    func pickerConfiguration() {
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = .whiteColor()
        pickerView.showsSelectionIndicator = true
    }
    
    func hidePickerView() {
        hiddenTextField.resignFirstResponder()
//        self.pickerView.removeFromSuperview()
//        toolBar.removeFromSuperview()
    }
    
    func showPickerView() {
//        self.view.addSubview(self.pickerView)
//        self.view.addSubview(self.toolBar)
    }
    
    /***** textFieldDelegate *****/
    
//    func textFieldDidBeginEditing(textField: UITextField) {
//        
//    }
    
    // MARK: - Picker Delegates
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerViewData[row] == "🇺🇸 United States of America" || pickerViewData[row] == "🇨🇦 Canada" {
            textFieldOutlet.text = "+1"
        }
        if pickerViewData[row] == "🇨🇦 Canada" {
            textFieldOutlet.text = "+393939393"
        }
    }
}

