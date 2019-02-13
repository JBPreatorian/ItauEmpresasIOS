//
//  VCiToken.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 21-12-18.
//  Copyright © 2018 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit

class VCiToken: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var LblAproved: UILabel!
    @IBOutlet weak var LblDescription: UILabel!
    @IBOutlet weak var textToken: UITextField!
    @IBOutlet weak var BtnValidToken: UIButton!
    @IBOutlet weak var ViewAlertMessage: UIView!
    @IBOutlet weak var ProcessActivity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadSetDataiToken()
        self.SetDesignObject()
        self.HideViewMessage()
        self.hiddemnProcessActivity()
        self.initializeTextFields()
    }
    func initializeTextFields() {
        self.textToken.delegate = self as? UITextFieldDelegate
        textToken.delegate = self as? UITextFieldDelegate
        textToken.keyboardType = UIKeyboardType.numberPad
        
    }
    func hiddemnProcessActivity()
    {
        self.ProcessActivity.isHidden = true
    }
    func InitProcessActivity()
    {
        ProcessActivity.startAnimating();
    }
    func StopProcessActivity()
    {
        ProcessActivity.stopAnimating()
    }
    func HideViewMessage()
    {
        self.ViewAlertMessage.isHidden = true
    }
    func SetDesignObject()
    {
        BtnValidToken.layer.cornerRadius = 10
        BtnValidToken.clipsToBounds = true
    }
    
    @IBAction func BtnBack(_ sender: Any) {
        if checkRemoveItemCore() == true
        {
           self.goToLogin()
        }else{
             print("checkRemoveItemCore is false")
        }
    }
    func goToLogin()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCLogin")
        self.present(controller, animated: true, completion: nil)
    }
    func goToCreatePin()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCCreatePin")
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func BtnValidToken(_ sender: Any) {
        
        // valida conection a internet
        if checkInternetConnection() == true
        {
            // valida Token
            if checkValidToken() == true
            {
                // valida campos validos
                if checkValidField()  == true {
                    self.goToCreatePin()
                }else{
                   print("checkValidField is false")
                }
            }else{
                print("checkValidToken is false")
            }
        }else{
            print("checkInternetConnection is false")
        }
    }
    func loadSetDataiToken(){
        self.LblDescription.text = "Ahora ingresa los números de tu token xxxx - x6382"
        self.LblDescription.numberOfLines = 3
        self.LblDescription.lineBreakMode = .byWordWrapping
    }
    func checkInternetConnection() -> Bool {
        var checkInternet = true
        
        
        return checkInternet
    }
    func checkRemoveItemCore() -> Bool {
        var checkRemove = true
        
        
        return checkRemove
    }
    func checkValidToken() -> Bool {
        var checkValidToken = true
        
        
        return checkValidToken
    }
    func checkValidField() -> Bool {
        var checkValid = true
        if self.textToken.text?.isEmpty ?? true
        {
            checkValid = false
            return checkValid
        }
        return checkValid
    }
    
    
    func textField(textField: UITextField,shouldChangeCharactersInRange range: NSRange,replacementString string: String)-> Bool
    {
        if string.characters.count == 0 {
            return true
        }
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        switch textField {
        case textToken:
            return prospectiveText.containsOnlyCharactersIn(matchCharacters: "0123456789") &&
                prospectiveText.characters.count <= 8
        case textToken:
            return prospectiveText.isNumeric() &&
                prospectiveText.characters.count <= 8
        default:
            return true
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 8
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        return changedText.count <= 8
    }
    
}
