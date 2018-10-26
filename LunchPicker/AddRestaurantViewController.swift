//
//  AddRestaurantViewController.swift
//  LunchPicker
//
//  Created by 周澎 on 1/17/16.
//  Copyright © 2016 ZP. All rights reserved.
//

import UIKit

class AddRestaurantViewController: UIViewController,UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet var MainView: UIView!
    @IBOutlet weak var NameTextField: UITextField!
    var Text = ""
    
    
    @IBAction func AddButton(_ sender: AnyObject) {
        self.NameTextField.resignFirstResponder()
        Add()
    }
    
    @IBAction func CancelButton(_ sender: AnyObject) {
        self.NameTextField.resignFirstResponder()
        self.dismiss(animated: true, completion: nil)
    }
    
    func Add(){
        self.Text = (NameTextField.text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))!
        if self.Text != ""{
            let Name = self.Text
            DataManager.Data.addCard(Name)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        Add()
        return true
    }
    /*
    error
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.MainView.endEditing(true)
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
