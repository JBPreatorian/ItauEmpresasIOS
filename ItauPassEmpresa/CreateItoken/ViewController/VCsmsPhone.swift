//
//  VCsmsPhone.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 21-12-18.
//  Copyright © 2018 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit
import SystemConfiguration
class VCsmsphone: UIViewController ,UITextFieldDelegate {
    var str_mensaje:String = "";
    
    @IBOutlet weak var LblTitulo: UILabel!
    @IBOutlet weak var LblDescrip: UILabel!
    @IBOutlet weak var Textphone: UITextField!
    @IBOutlet weak var ViewMesageAlert: UIView!
    @IBOutlet weak var LblMessageAlert: UILabel!
    @IBOutlet weak var textSMS: UITextField!
    @IBOutlet weak var LblExpiration: UILabel!
    @IBOutlet weak var BtnValidSMS: UIButton!
    
    
    @IBOutlet weak var ViewDialogError: UIView!
    
    @IBOutlet weak var ViewDialogTriangule: UIView!
    @IBOutlet weak var ProcessActivity: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadSetDatasmsPhone()
        self.SetLabelDefault()
        self.HideViewMessage()
        self.SetDesignObject()
        self.hiddemnProcessActivity()
        self.initializeTextFields()
    }
    func initializeTextFields() {
        self.textSMS.delegate = self as? UITextFieldDelegate
        textSMS.delegate = self as? UITextFieldDelegate
        textSMS.keyboardType = UIKeyboardType.numberPad
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
       self.ViewMesageAlert.isHidden = true
    }
    func SetLabelDefault()
    {
        self.LblExpiration.text = ""
    }
    func SetDesignObject()
    {
        BtnValidSMS.layer.cornerRadius = 10
        BtnValidSMS.clipsToBounds = true
    }
    func CloseAlertViews()
    {
        self.ViewMesageAlert.isHidden = true
        self.LblMessageAlert.text = ""
    }
    @IBAction func BtnCloseAlert(_ sender: Any) {
        self.CloseAlertViews()
        print("Close View")
    }
    
    @IBAction func BtnBack(_ sender: Any) {
        self.goToLogin()
    }
    
    // Boton Valida SMS
    @IBAction func BtnValidSMS(_ sender: Any) {
        if checkValidStateConexion() == true {
            
            // Valida Campos
            if checkValidField() == true
            {
                // Valida si fue enviado
                if checkSentSmsPhone() == true{
                    
                    //Verifica si es Itoken o coordenadas
                    self.routerByTokenCoordinate()
                }else{
                    str_mensaje = self.checkTypeMessage(CodeAlert: 7)
                    showErrorMessages(strMessage:str_mensaje)
                    print("Not SMS response")
                }
            }else{
                str_mensaje = self.checkTypeMessage(CodeAlert: 6)
                showErrorMessages(strMessage:str_mensaje)
                
                print("codigo SMS is False")
            }
            
        }else{
            str_mensaje = self.checkTypeMessage(CodeAlert: 5)
            showErrorMessages(strMessage:str_mensaje)

                print("State API Connection is False")
        }
    }

    func routerByTokenCoordinate()
    {
        // necesita consumir json Itau de apoderado y verificar si es itoken o coordenadas
        //
        var codrouter:Int = 2
        
        if codrouter == 1
        {
            self.goToiToken()
        }
        if codrouter == 2
        {
            self.goToCoordinates()
        }
    }
    
    func showErrorMessages(strMessage:String)
    {
        self.ViewMesageAlert.isHidden = false
        self.LblMessageAlert.text = strMessage
        self.LblMessageAlert.numberOfLines = 3
        self.LblMessageAlert.lineBreakMode = .byWordWrapping
    }
    func checkSentSmsPhone() -> Bool {
        let checkState = true
        // debe consumir servicio de envio de SMS
        
        return checkState
    }
    func loadSetDatasmsPhone(){
        self.LblDescrip.text = "Hemos enviado un SMS a tu teléfono con un código de 8 dígitos."
        self.LblDescrip.numberOfLines = 3
        self.LblDescrip.lineBreakMode = .byWordWrapping
    }
    func checkValidStateConexion() -> Bool {
        let checkState = true
        
        
        return checkState
    }
    func checkValidField() -> Bool {
        var checkfield = true

        if self.textSMS.text?.isEmpty ?? true
        {
            checkfield = false
            return checkfield
        }
        
        return checkfield
    }
    
    func checkTypeMessage(CodeAlert:Int) -> String{
        var messages:String = ""
        
        switch CodeAlert
        {
        case 1:
            messages = "Tus Datos no son los correctos, intentalo nuevamente"
            break;
        case 2:
            messages = "Acceso exclusivo para clientes Empresas,descarga tu App Itaú Chile o Itaú Personal Bank"
            break;
        case 3:
            messages = "Tienes poca señal de internet revisa tu conexión y vuelve a intentarlo más tarde"
            break;
        case 4:
            messages = "Hemos bloqueado tu clave por tu seguridad , Llamanos al +5622686 0888 o ingresa a www.itau.cl para solucionarlo"
            break;
        case 5:
            messages = "Disculpa , estamos teniendoi problemas técnicos . intenta ingresar más tarde."
            break;
        case 6:
            messages = "El código incorrecto,  intentar nuevamente."
            break;
        case 7:
            messages = "Error de conexión o aplicación , favor intentar nuevamente."
            break;
        default:
            messages = "Error de conexión o aplicación , favor intentar nuevamente"
            break;
        }
        
        return messages
    }
    func textField(textField: UITextField,shouldChangeCharactersInRange range: NSRange,replacementString string: String)-> Bool
    {
        if string.characters.count == 0 {
            return true
        }
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        switch textField {
        case textSMS:
            return prospectiveText.containsOnlyCharactersIn(matchCharacters: "0123456789") &&
                prospectiveText.characters.count <= 8
        case textSMS:
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
    
    func goToLogin()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCLogin")
        self.present(controller, animated: true, completion: nil)
    }
    func goToiToken()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCiToken")
        self.present(controller, animated: true, completion: nil)
    }
    func goToCoordinates()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCCoordinates")
        self.present(controller, animated: true, completion: nil)
    }

    /*
    func isConnectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
        if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
            return false
        }
        
        /* Only Working for WIFI
         let isReachable = flags == .reachable
         let needsConnection = flags == .connectionRequired
         
         return isReachable && !needsConnection
         */
        
        // Working for Cellular and WIFI
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        let ret = (isReachable && !needsConnection)
        
        return ret
        
    }*/

}
