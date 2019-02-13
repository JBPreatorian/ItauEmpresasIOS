//
//  VCCreatePin.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 21-12-18.
//  Copyright © 2018 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit
import SDKiOSCore

class VCCreatePin: UIViewController ,UITextFieldDelegate {
    
    struct UserPin:Decodable{
        var names: String!
        var lnames: String!
        var ide: String!
        var pin: String!
    }

    var saveRutSwitchOn: Bool = true
    @IBOutlet weak var ViewMensageAlert: UIView!
    @IBOutlet weak var LblMensageAlert: UILabel!
    @IBOutlet weak var LblTitlePin: UILabel!
    @IBOutlet weak var LblAprovedPin: UILabel!
    @IBOutlet weak var LblDescription: UILabel!
    @IBOutlet weak var textPin: UITextField!
    @IBOutlet weak var textRepin: UITextField!
    @IBOutlet weak var BtnCreatePin: UIButton!
    @IBOutlet weak var LblErrorPinMesage: UILabel!
    
    @IBOutlet weak var ProcessActivity: UIActivityIndicatorView!
    private let apiManager = APIGlobalProvider()
    var strMensage:String = ""
    public var ideUserFromCore:String = ""
    public var namesUserFromCore:String = ""
    public var lastNamesFromCore:String = ""
    //private  let storage : UserDefaultStorage
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadSetDataCreatePin()
        self.SetDesignObject()
        self.isHiddenErrorMesagePin(cod:0)
        self.IsHiddenViewAlertMensage()
        self.initializeTextFields()
        
        self.hiddemnProcessActivity()
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
    
    func initializeTextFields() {
        self.textPin.delegate = self as? UITextFieldDelegate
        textPin.delegate = self as? UITextFieldDelegate
        textPin.keyboardType = UIKeyboardType.numberPad
        textRepin.delegate = self as? UITextFieldDelegate
        textRepin.keyboardType = UIKeyboardType.numberPad
    }
    func isHiddenErrorMesagePin(cod:Int)
    {
      if(cod == 0)
      {
            self.LblErrorPinMesage.isHidden = true
      }else{
            self.LblErrorPinMesage.isHidden = false
      }
    }
    @IBAction func TextFieldEndEdit(_ sender: Any) {
       // print("Lost Focus Textfield")
        if (self.textRepin.text != self.textPin.text)
        {
            self.isHiddenErrorMesagePin(cod:1)
            self.strMensage = self.ctrlErrorPin(codErr:"IDEPIN") //"Campo PIN y RePIN debe ser identico"
            self.LblErrorPinMesage.text = self.strMensage
            self.LblErrorPinMesage.numberOfLines = 3
            self.LblErrorPinMesage.lineBreakMode = .byWordWrapping
        }else{
            self.isHiddenErrorMesagePin(cod:0)
            self.strMensage = ""
            self.LblErrorPinMesage.text = self.strMensage
            self.LblErrorPinMesage.numberOfLines = 3
            self.LblErrorPinMesage.lineBreakMode = .byWordWrapping
        }
    }
    
    func SetDesignObject()
    {
        BtnCreatePin.layer.cornerRadius = 10
        BtnCreatePin.clipsToBounds = true
    }
    
    func IsHiddenViewAlertMensage()
    {
        self.ViewMensageAlert.isHidden = true
        self.LblMensageAlert.text = ""
    }
    func IsVisibleViewAlertMensage()
    {
        self.ViewMensageAlert.isHidden = false
        self.LblMensageAlert.text = self.strMensage
        self.LblMensageAlert.numberOfLines = 3
        self.LblMensageAlert.lineBreakMode = .byWordWrapping
    }
    @IBAction func CloseAlertView(_ sender: Any) {
        self.IsHiddenViewAlertMensage()
    }
    @IBAction func BtnCreatePin(_ sender: Any) {
        if self.checkValidField() == true
        {
            if self.SavePinCoreData() == true
            {
                print("Saved PIN")
                self.goToFinish()
            }else{
                self.strMensage = self.ctrlErrorPin(codErr:"ERRPIN")
                showErrorMessages(strMessage:self.strMensage)
                print("No Saved PIN")
                self.IsVisibleViewAlertMensage()
            }
        }else{
             self.IsVisibleViewAlertMensage()
        }
    }
    func showErrorMessages(strMessage:String)
    {
         self.ViewMensageAlert.isHidden = false
         self.LblMensageAlert.text = strMessage
         self.LblMensageAlert.numberOfLines = 3
         self.LblMensageAlert.lineBreakMode = .byWordWrapping
    }
    func ctrlErrorPin(codErr:String)  -> String
    {
        var strError = ""
        switch codErr {
        case "IDEPIN":
            strError = "Campo PIN y RePIN debe ser identico"
        case "ERRPIN":
            strError = "Ha ocurrido un error en dispositivo"
        default:
            strError = "Ha ocurrido un error"
        }
        
        return strError
    }
    func goToFinish()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCFinish")
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func textFieldChange(_ sender: Any) {
      //  print("changed textfield")
       
    }
    func getDataUserCore()
    {
        if let loadedData = SecureData.load(key: "dataUser") {
            do {
                let login = try JSONDecoder().decode(UserPin.self, from: loadedData)
                self.namesUserFromCore = login.names
                self.lastNamesFromCore =  login.lnames
                self.ideUserFromCore =  login.ide
                print(login)
                //self.loadView.accountView.login = login
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func SavePinCoreData() -> Bool {
        self.getDataUserCore()
        var SavedItem:Bool = true
       
        var mDictionary : [String: Any] =
            [ "names": self.namesUserFromCore,
              "lnames":self.lastNamesFromCore,
              "ide": self.ideUserFromCore,
              "pin": self.textPin.text
            ]
    
        let jsonData = try! JSONSerialization.data(withJSONObject: mDictionary, options: [.prettyPrinted])
        let json = String(data: jsonData, encoding: String.Encoding.utf8)!
        print(json)
        
        if self.saveRutSwitchOn
        {
           SecureData.save(key: "pinUser", data: json.data(using: .utf8)!)
        }
        SavedItem = self.saveRutSwitchOn
        return SavedItem
    }
    
    func loadSetDataCreatePin(){
        self.apiManager.getContext() { (contexts, error) in
            if let error = error {
                print("Get contexts error: \(error.localizedDescription)")
                return
            }
            guard let contexts = contexts  else { return }
            print("Current contexts Object:")
            DispatchQueue.main.sync {
                if let gtitle = contexts.objetoRetorno?.contenidoPantallaPinDTO?.title {
                    print("gtitle :"+gtitle)
                    self.LblTitlePin.text = gtitle
                }
                
                if let gDescrip = contexts.objetoRetorno?.contenidoPantallaPinDTO?.description {
                    print("gDescrip :"+gDescrip)
                    self.LblDescription.text = gDescrip
                }
            }
            
        }
       // self.LblDescription.text = "Ahora crea un Pin único de 4 dígitos, este te servirá para acceder a tu aplicación y obtener tus claves para transaccionar."
        self.LblDescription.numberOfLines = 3
        self.LblDescription.lineBreakMode = .byWordWrapping
    }
    func goToLogin()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCLogin")
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func BtnBack(_ sender: Any) {
        
        self.goToLogin()
    }
    func checkValidField() -> Bool {
        var checkfield = true
        
        if self.textPin.text?.isEmpty ?? true
        {
            checkfield = false
            self.strMensage = "Campo PIN Vacio , favor ingresar PIN"
            return checkfield
        }
        if self.textRepin.text?.isEmpty ?? true
        {
            checkfield = false
            self.strMensage = "Campo RePIN Vacio , favor ingresar RePIN"
            return checkfield
        }
        if (self.textRepin.text != self.textPin.text)
        {
            checkfield = false
            self.strMensage = "Campo PIN y RePIN debe ser identico , favor ingresar nuevamente"
            return checkfield
        }
        return checkfield
    }
    
    func textField(textField: UITextField,shouldChangeCharactersInRange range: NSRange,replacementString string: String)-> Bool
    {
        if string.characters.count == 0 {
            return true
        }
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        switch textField {
        case textPin:
            return prospectiveText.containsOnlyCharactersIn(matchCharacters: "0123456789") &&
                prospectiveText.characters.count <= 4
        case textRepin:
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
