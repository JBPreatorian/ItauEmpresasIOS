//
//  VCWelcomeItoken.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 21-12-18.
//  Copyright © 2018 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit

class VCWelcomeItoken: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var btnEnterItoken: UIButton!
    @IBOutlet weak var ViewTemLogItokens: UIView!
    @IBOutlet weak var ViewForgotPass: UIView!
    //@IBOutlet weak var BtnForgotPass: UIButton!
    //@IBOutlet weak var BtnForgotPass: UIButton!
    @IBOutlet weak var BtnForgotPass: UIButton!
    @IBOutlet weak var btnCloseResetPass: UIButton!
    //@IBOutlet weak var btnCloseResetPass: UIButton!
    //@IBOutlet weak var LblDescripResetPass: UILabel!
    //@IBOutlet weak var BtnResetPass: UIButton!
    @IBOutlet weak var BtnResetPass: UIButton!
    @IBOutlet weak var textPIN: NMTextField!
    @IBOutlet weak var ViewLoginItoken: UIView!
    var strMensage:String = ""
    //@IBOutlet weak var btnEnterItoken: UIButton!
    @IBOutlet weak var ViewPassForgot: UIView!
    @IBOutlet weak var LblDescripResetPass: UILabel!
    @IBOutlet weak var BtnResetPassPin: UIButton!
    var counterWrongpass:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadSetData()
        self.ViewPassForgot.isHidden = true
        self.BtnForgotPass.isHidden = false
        self.btnCloseResetPass.isHidden = true
        self.LblDescripResetPass.isHidden = true
        self.initializeTextFields()
        self.SetDesignObject()
        self.hiddenButtonClean()
        self.disableButtonLoging()
    }
    class NMTextField: UITextField {
        override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
            if action == #selector(UIResponderStandardEditActions.paste(_:)) {
                return false
            }
            return super.canPerformAction(action, withSender: sender)
        }
    }
    func hiddenButtonClean()
    {
        self.BtnResetPassPin.isHidden = true
        //self.BtnCleanPassword.isHidden = true
    }
    
    func initializeTextFields() {
        self.textPIN.delegate = self as? UITextFieldDelegate
        textPIN.delegate = self as? UITextFieldDelegate
        textPIN.keyboardType = UIKeyboardType.numberPad
    }
    func SetDesignObject()
    {
        BtnResetPass.layer.cornerRadius = 10
        BtnResetPass.clipsToBounds = true
        btnEnterItoken.layer.cornerRadius = 10
        btnEnterItoken.clipsToBounds = true
        ViewPassForgot.layer.cornerRadius = 20
        ViewPassForgot.clipsToBounds = true
        ViewLoginItoken.layer.cornerRadius = 5
        ViewLoginItoken.clipsToBounds = true
    }
    
    @IBAction func textFieldEditing(_ sender: Any) {
        self.BtnResetPassPin.isHidden = false
        self.enableButtonLoging()
    }
    @IBAction func BtnEditingPass(_ sender: Any) {
        self.BtnResetPassPin.isHidden = false
    }
    @IBAction func BtnResetPassPin(_ sender: Any) {
        CleanItemtextField(Cod:0)
    }
    func CleanItemtextField(Cod:Int)
    {
        switch Cod {
        case 0:
            self.textPIN.text = ""
        //case 1:
          //  self.textPassInt.text = ""
        default:
            print("default")
        }
    }
    func loadSetData(){
       
        self.LblDescripResetPass.text = "Si olvidaste tu contraseña debemos borrar los datos actuales y deberás volver a configurar tu iToken"
        self.LblDescripResetPass.numberOfLines = 5
        self.LblDescripResetPass.lineBreakMode = .byWordWrapping
    }
    func ctrlErrorWelcome(codErr:String)  -> String
    {
        var strError = ""
        switch codErr {
        case "EMTPIN":
            strError = "Campo PIN Vacio , favor ingresar PIN"
        case "ERRPIN":
            strError = "Ocurrio un error en el proceso"
        default:
            strError = "Ha ocurrido un error"
        }
    
        return strError
    }
    func checkValidField() -> Bool {
        var checkValid = true
        
        if self.textPIN.text?.isEmpty ?? true
        {
            checkValid = false
            self.strMensage = self.ctrlErrorWelcome(codErr:"EMTPIN")//"Campo PIN Vacio , favor ingresar PIN"
            return checkValid
        }
        return checkValid
    }
    func goToMenu()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCMenuItoken")
        self.present(controller, animated: true, completion: nil)
        
    }
    func goToLogin()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCLogin")
        self.present(controller, animated: true, completion: nil)
    }
    func goToBlockedItoken()
    {
       /* let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCMenuItoken")
        self.present(controller, animated: true, completion: nil)
       */
    }
    
    func checkEnterItoken(pass:Int) -> Bool
    {
        let checkEnter = true
        
        
        return checkEnter
    }
    func savedWrongEnterPass()
    {
        //counterWrongpass = counterWrongpass + 1
    }
    func checkedWrongEnterPass(cant:Int)
    {
        var str_mgs:String = ""
        
        switch cant {
                case 1:
                   str_mgs = ""
                case 2:
                   str_mgs = ""
                case 3:
                    str_mgs = ""
                case 4:
                     str_mgs = "Una vez mas tendremos que borrar tu Itoken"
                     self.showErrorMessages(strMessage:str_mgs)
                     self.goToLogin()
                case 5:
                    //mensaje no parametrizado aun , esta solo test
                    str_mgs = "Tendremos que borrar tu itoken"
                    self.showErrorMessages(strMessage:str_mgs)
                    self.blockedItoken()
            
                default:
                    str_mgs = ""
                    }
    }
    
    func showErrorMessages(strMessage:String)
    {
        /*
         self.ViewAlerts.isHidden = false
         self.LblMensajeAlert.text = strMessage
         self.LblMensajeAlert.numberOfLines = 3
         self.LblMensajeAlert.lineBreakMode = .byWordWrapping
         */
    }
    func blockedItoken()
    {
        if self.deleteFullStorage() == true
        {
            self.goToInicioWelcome()
        }else{
            
        }
    }
    func deleteFullStorage() -> Bool{
        let deletedStorage = true
        
        
        return deletedStorage
    }
    func goToInicioWelcome()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCWelcome")
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func btnEnterItoken(_ sender: Any) {
        
        if checkValidField() == true {
            if checkEnterItoken(pass:Int(self.textPIN!.text!)!) == true
            {
               self.goToMenu()
            }else{
                savedWrongEnterPass()
            }
        }else{
            self.strMensage = self.ctrlErrorWelcome(codErr:"EMTPIN")//"Campo PIN vacio, favor llenar"
           //self.LblErrorPinMesage.text = self.strMensage
           //self.LblErrorPinMesage.numberOfLines = 3
           // self.LblErrorPinMesage.lineBreakMode = .byWordWrapping
        }
       
    }
    @IBAction func BtnForgotPass(_ sender: Any) {
        self.ViewPassForgot.isHidden = false
        self.BtnForgotPass.isHidden = false
        self.BtnResetPass.isHidden = false
        self.btnCloseResetPass.isHidden = false
        self.LblDescripResetPass.isHidden = false
        
    }
    
    
    @IBAction func BtnResetPass(_ sender: Any) {
        if goToResetPass() == true
        {
            self.goToLogin()
        }else{
            self.strMensage = self.ctrlErrorWelcome(codErr:"ERRPIN")
        }
    }
    func goToLoginInit()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCLogin")
        self.present(controller, animated: true, completion: nil)
    }
    func goToResetPass()->Bool
    {
        var resetpass = false
        if deleteTokensDevice() == true
        {
            if deleteTokensServer() == true
            {
                resetpass = true
                return resetpass
            }else{
                print("deleteTokensServer is false")
                resetpass = false
                return resetpass
            }
            
        }else{
            print("deleteTokensDevice is false")
            resetpass = false
            return resetpass
        }
    }
    func deleteTokensDevice() ->Bool
    {
        let deleteToken = true
        
        
        return deleteToken
    }
    func deleteTokensServer() ->Bool
    {
        let deleteTokenSer = true
        
        
        return deleteTokenSer
    }
    
    @IBAction func btnCloseResetPass(_ sender: Any) {
        self.ViewPassForgot.isHidden = true
        self.BtnResetPass.isHidden = true
        self.BtnForgotPass.isHidden = false
        self.btnCloseResetPass.isHidden = true
        self.LblDescripResetPass.isHidden = true
    }
    func disableButtonLoging()
    {
        btnEnterItoken.isEnabled = false
        //Btnlogin.titleLabel!.textColor = UIColor.gray
        btnEnterItoken.setTitleColor(.gray, for: .normal)
        
    }
    func enableButtonLoging()
    {
        btnEnterItoken.isEnabled = true
        btnEnterItoken.setTitleColor(.white, for: .normal)
    }
    func textField(textField: UITextField,shouldChangeCharactersInRange range: NSRange,replacementString string: String)-> Bool
    {
        if string.characters.count == 0 {
            return true
        }
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        switch textField {
        case textPIN:
            return prospectiveText.containsOnlyCharactersIn(matchCharacters: "0123456789") &&
                prospectiveText.characters.count <= 4
        case textPIN:
            return prospectiveText.isNumeric() &&
                prospectiveText.characters.count <= 4
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
        return updatedText.count <= 4
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        return changedText.count <= 4
    }
    
}
