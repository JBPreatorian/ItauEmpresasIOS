//
//  VCCoordinates.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 09-01-19.
//  Copyright © 2019 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit

class VCCoordinates: UIViewController ,UITextFieldDelegate {
    
    @IBOutlet weak var ViewMensageAlert: UIView!
    
    @IBOutlet weak var LblMensageAlert: UILabel!
    
    @IBOutlet weak var LblTitle: UILabel!
    @IBOutlet weak var LblDescrip: UILabel!
    @IBOutlet weak var LblCordOne: UILabel!
    @IBOutlet weak var LblCordTwo: UILabel!
    @IBOutlet weak var LblCordThree: UILabel!
    @IBOutlet weak var textCordOne: UITextField!
    @IBOutlet weak var textCordTwo: UITextField!
    @IBOutlet weak var textCordThree: UITextField!
   // @IBOutlet weak var BtnValidateCord: UIButton!
    
    @IBOutlet weak var BtnBack: UIButton!
    @IBOutlet weak var BtnValidateCord: UIButton!
    //@IBOutlet weak var BtnBack: UIButton!
    
    private let apiManager = APIGlobalProvider()
     var strMensage:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setObjectView()
        self.loadContext()
        self.initializeTextFields()
        self.loadCoordinatesScreen()
        self.HideViewMessage()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func HideViewMessage()
    {
        self.ViewMensageAlert.isHidden = true
    }
    func ShowViewMessage(msg:String)
    {
        self.LblMensageAlert.text = msg
        self.LblMensageAlert.numberOfLines = 3
        self.LblMensageAlert.lineBreakMode = .byWordWrapping
        self.ViewMensageAlert.isHidden = false
    }
    func initializeTextFields() {
        self.textCordOne.delegate = self as? UITextFieldDelegate
        self.textCordTwo.delegate = self as? UITextFieldDelegate
        self.textCordThree.delegate = self as? UITextFieldDelegate
        textCordOne.delegate = self as? UITextFieldDelegate
        textCordOne.keyboardType = UIKeyboardType.numberPad
        textCordTwo.delegate = self as? UITextFieldDelegate
        textCordTwo.keyboardType = UIKeyboardType.numberPad
        textCordThree.delegate = self as? UITextFieldDelegate
        textCordThree.keyboardType = UIKeyboardType.numberPad
    }
    
    func setObjectView()
    {
        BtnValidateCord.layer.cornerRadius = 10
        BtnValidateCord.clipsToBounds = true
        BtnBack.layer.cornerRadius = 10
        BtnBack.clipsToBounds = true
    }
    func loadCoordinatesScreen()
    {
        /*
        self.LblCordThree.text = "A2"
        self.LblCordOne.text = "C1"
        self.LblCordTwo.text = "D3"
        */
    }
    func loadContext()
    {
        self.apiManager.getContext() { (contexts, error) in
            if let error = error {
                print("Get contexts error: \(error.localizedDescription)")
                return
            }
            guard let contexts = contexts  else { return }
            print("Current contexts Object:")
            DispatchQueue.main.sync {
                if let gTitle = contexts.objetoRetorno?.contenidoPantallaUnoDTO?.welcome {
                    print("gTitle :"+gTitle)
                    self.LblTitle.text = gTitle
                }
                
                if let gDescrip = contexts.objetoRetorno?.contenidoPantallaUnoDTO?.descripcion {
                    print("gDescrip :"+gDescrip)
                    self.LblDescrip.text = gDescrip
                }
            }
            self.LblTitle.numberOfLines = 5
            self.LblTitle.lineBreakMode = .byWordWrapping
            self.LblDescrip.numberOfLines = 5
            self.LblDescrip.lineBreakMode = .byWordWrapping
        }
    }
    @IBAction func BtnValidateCord(_ sender: Any) {
        if validInternetConnection() == true
        {
            if checkValidField() == true
            {
                self.HideViewMessage()
                if ValidateCoordinates() == true
                {
                    if SendDataCordinate() == true
                    {
                        self.goToCreatePin()
                    }else{
                        print("SendDataCordinate is false")
                    }
                }else{
                    print("ValidateCoordinates is false")
                }
            }else{
                print("checkValidField is false")
                
            }
        }else{
            print("validInternetConnection is false")
        }
        
    }
    
    @IBAction func BtnCloseViewAlert(_ sender: Any) {
    }
    
    func ctrlErrorCordinates(codErr:String) -> String
    {
        var strError = ""
        switch codErr
        {
            case "INTCHK":
                    strError = "Tienes poca señal de internet revisa tu conexión y vuelve a intentarlo más tarde"
                    self.showErrorMessages(strMessage:strError)
            case "ERRCOR":
                    strError = "Ha ocurrido un error en dispositivo"
                    self.showErrorMessages(strMessage:strError)
            case "ERRDLT":
                    strError = "Ha ocurrido un error interno"
                    self.showErrorMessages(strMessage:strError)
            case "ERRPRO":
                    strError = "Ha ocurrido un error en el proceso"
                    self.showErrorMessages(strMessage:strError)
            default:
                    strError = "Ha ocurrido un error"
                    self.showErrorMessages(strMessage:strError)
        }
        return strError
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
    func validInternetConnection() -> Bool {
        var validInternet = true
        
        return validInternet
    }
    func SendDataCordinate() -> Bool {
        var sendDatavalid = true
        
        return sendDatavalid
    }
    func ValidateCoordinates() -> Bool {
        var checkvalid = true
        if validateCoordinateLabels() == false
        {
            checkvalid = false
        }
        return checkvalid
    }
    func validateCoordinateLabels() -> Bool
    {
        var ValidateCoorLbl = true
        if self.LblCordOne.text?.isEmpty ?? true
        {
            ValidateCoorLbl = false
            self.strMensage = "Error carga coordenadas"
            
            return ValidateCoorLbl
        }
        if self.LblCordTwo.text?.isEmpty ?? true
        {
            ValidateCoorLbl = false
            self.strMensage = "Error carga coordenadas"
            return ValidateCoorLbl
        }
        if self.LblCordThree.text?.isEmpty ?? true
        {
            ValidateCoorLbl = false
            self.strMensage = "Error carga coordenadas"
            return ValidateCoorLbl
        }
        return ValidateCoorLbl
    }
    func checkValidField() -> Bool {
        var checkfield = true
        
        if self.textCordOne.text?.isEmpty ?? true
        {
            checkfield = false
            self.strMensage = "Primer campo coordenadas vacio, favor llenar"
            self.ShowViewMessage(msg:self.strMensage)
            return checkfield
        }
        if self.textCordTwo.text?.isEmpty ?? true
        {
            checkfield = false
            self.strMensage = "Segundo campo coordenadas vacio, favor llenar"
            self.ShowViewMessage(msg:self.strMensage)
            return checkfield
        }
        if self.textCordThree.text?.isEmpty ?? true
        {
            checkfield = false
            self.strMensage = "Tercer campo coordenadas vacio, favor llenar"
            self.ShowViewMessage(msg:self.strMensage)
            return checkfield
        }
        
        return checkfield
    }
    @IBAction func BtnBack(_ sender: Any) {
        if self.deleteData() == true
        {
           self.goToLogin()
        }else{
           print("deleteData is false")
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
     func deleteData() -> Bool
     {
        var deletedvalid = true
        
        return deletedvalid
     }
    
    func textField(textField: UITextField,shouldChangeCharactersInRange range: NSRange,replacementString string: String)-> Bool
    {
        if string.characters.count == 0 {
            return true
        }
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        switch textField {
        case textCordOne:
            return prospectiveText.containsOnlyCharactersIn(matchCharacters: "0123456789") &&
                prospectiveText.characters.count <= 2
        case textCordOne:
            return prospectiveText.isNumeric() &&
                prospectiveText.characters.count <= 2
        case textCordTwo:
            return prospectiveText.containsOnlyCharactersIn(matchCharacters: "0123456789") &&
                prospectiveText.characters.count <= 2
        case textCordTwo:
            return prospectiveText.isNumeric() &&
                prospectiveText.characters.count <= 2
        case textCordThree:
            return prospectiveText.containsOnlyCharactersIn(matchCharacters: "0123456789") &&
                prospectiveText.characters.count <= 2
        case textCordThree:
            return prospectiveText.isNumeric() &&
                prospectiveText.characters.count <= 2
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
        return updatedText.count <= 2
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        return changedText.count <= 2
    }
    
}
