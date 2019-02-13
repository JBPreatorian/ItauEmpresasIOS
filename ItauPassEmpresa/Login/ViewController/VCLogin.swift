//
//  VCLogin.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 21-12-18.
//  Copyright © 2018 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit
import CoreData
import SDKiOSCore
//import UI
struct ClientLogon: Codable {
    let names: String?
    let lnames: String?
    let ide: String?
}

struct data: Codable {
    let context : Context?
    let application_data : Application_data?
    let client_credentials : Client_credentials?
}
struct Context: Codable {
   let channel_id: String?
   let application:  String?
   let timestamp:  String?
}
struct Application_data: Codable {
    let application_type:  String?
    let application_version:  String?
}
struct Client_credentials: Codable {
    let client_id:  String?
    let password:  String?
}



class VCLogin: UIViewController, UITextFieldDelegate {
    var saveRutSwitchOn: Bool = true
    @IBOutlet weak var ViewTemplateLogin: UIView!
    @IBOutlet weak var ViewAlerts: UIView!
    @IBOutlet weak var LblEmpresa: UILabel!
    @IBOutlet weak var LblPyme: UILabel!
    @IBOutlet weak var ImagenEmpresa: UIImageView!
    @IBOutlet weak var ImagenPyme: UIImageView!
    @IBOutlet weak var textRut: UITextField!
    @IBOutlet weak var textPassInt: UITextField!
    @IBOutlet weak var ViewLogin: UIView!
    @IBOutlet weak var LblMensajeAlert: UILabel!
    @IBOutlet weak var ProcessActivity: UIActivityIndicatorView!
    @IBOutlet weak var Btnlogin: UIButton!
    @IBOutlet weak var BtnCleanIDE: UIButton!
    @IBOutlet weak var BtnCleanPassword: UIButton!
    
    public var ideUserFromCore:String = ""
    public var namesUserFromCore:String = ""
    public var lastNamesFromCore:String = ""
    
    private let apiManager = APIGlobalProvider()
    private let apiManagerLogs = APIManagerLogin()
    private let apiLogin = APILoginManager()
    public let stubDataURL = "http://localhost:8080/app-empresa/login"
    public let saveStotage = SecureData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadSetData()
        self.setHiddenViews()
        self.ProcessActivity.isHidden = true
        self.disableButtonLoging()
        self.setCornerObjects()
        self.initializeTextFields()
        self.hiddenButtonClean()
        self.textRut.delegate = self as? UITextFieldDelegate
    
    
    }
    func hiddenButtonClean()
    {
        self.BtnCleanIDE.isHidden = true
        self.BtnCleanPassword.isHidden = true
    }
    
    
    func initializeTextFields() {
        textRut.delegate = self as? UITextFieldDelegate
        textRut.keyboardType = UIKeyboardType.numberPad
        
    }
    func setCornerObjects()
    {
        Btnlogin.layer.cornerRadius = 10
        Btnlogin.clipsToBounds = true
        ViewLogin.layer.cornerRadius = 5
        ViewLogin.clipsToBounds = true
        
            self.textRut.attributedPlaceholder = NSAttributedString(string: "RUT",
                                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        

    }
    func setHiddenViews()
    {
        self.ViewAlerts.isHidden = true
    }
    func disableButtonLoging()
    {
        Btnlogin.isEnabled = false
        //Btnlogin.titleLabel!.textColor = UIColor.gray
        Btnlogin.setTitleColor(.gray, for: .normal)
        
    }
    func enableButtonLoging()
    {
        Btnlogin.isEnabled = true
        Btnlogin.setTitleColor(.white, for: .normal)
    }
    func CleanItemtextField(Cod:Int)
    {
        switch Cod {
        case 0:
            self.textRut.text = ""
        case 1:
            self.textPassInt.text = ""
        default:
            print("default")
        }
    }
    @IBAction func textFieldRutEditing(_ sender: Any) {
        //print("Editing textfield")
        self.BtnCleanIDE.isHidden = false
    }
    
    @IBAction func textFieldPassEditing(_ sender: Any) {
       self.BtnCleanPassword.isHidden = false
       self.enableButtonLoging()
    }
    
    @IBAction func textEndingEditRut(_ sender: Any) {
        self.BtnCleanIDE.isHidden = false
    }
    
    @IBAction func textEndingEditPass(_ sender: Any) {
        
        self.BtnCleanPassword.isHidden = true
    }
    
    @IBAction func BtnCleanIDE(_ sender: Any) {
        CleanItemtextField(Cod:0)
    }

    @IBAction func BtnCleanPassword(_ sender: Any) {
        CleanItemtextField(Cod:1)
    }
    
    @IBAction func BtnViewAlertrClose(_ sender: Any) {
        self.ViewAlerts.isHidden = true
        self.LblMensajeAlert.text = ""
        print("Close View")
        
    }
    /*
    @IBAction func BtnCloseViewAlert(_ sender: Any) {
        self.ViewAlerts.isHidden = true
        self.LblMensajeAlert.text = ""
    }
    */
    func loadSetData(){
       
        self.apiManager.getContext() { (contexts, error) in
            if let error = error {
                print("Get contexts error: \(error.localizedDescription)")
                return
            }
            guard let contexts = contexts  else { return }
            print("Current contexts Object:")
            DispatchQueue.main.sync {
                if let gDescripEmpresa = contexts.objetoRetorno?.contenidoPantallaDosDTO?.empresa {
                    print("gDescripEmpresa :"+gDescripEmpresa)
                    self.LblEmpresa.text = gDescripEmpresa
                }
                
                if let gDescripPyme = contexts.objetoRetorno?.contenidoPantallaDosDTO?.pyme {
                    print("gDescripPyme :"+gDescripPyme)
                    self.LblPyme.text = gDescripPyme
                }
            }
            
        }
       // self.LblEmpresa.text = "Si usas el sitio de empresa ingresa tu RUT de apoderado"
        self.LblEmpresa.numberOfLines = 3
        self.LblEmpresa.lineBreakMode = .byWordWrapping
        
       // self.LblPyme.text = "Si usas el sitio de PYME deberás poner el rut de la empresa"
        self.LblPyme.numberOfLines = 3
        self.LblPyme.lineBreakMode = .byWordWrapping
        
    }
    
    func checkValidUserLogin(user:String,pass:String) -> Bool {
        
      return true
    }
    func checkValidField() -> Bool {
        var checkfield = true

        if self.textRut.text?.isEmpty ?? true
        {
           checkfield = false
            return checkfield
            
        }
        if self.textPassInt.text?.isEmpty ?? true
        {
            checkfield = false
            return checkfield
        }
        return checkfield
    }
    
    
    func textFieldDidChange(textField: UITextField) {
        //your code
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
            messages = "Disculpa , estamos teniendo problemas técnicos . intenta ingresar más tarde."
            break;
        case 6:
            messages = "Rut o Password incorrecto, favor intentar nuevamente."
            break;
        case 7:
            messages = "Rut o Password vacios, favor intentar nuevamente."
            break;
        default:
            messages = "Error de conexión o aplicación , favor intentar nuevamente"
            break;
        }
        
        return messages
    }
    
    @IBAction func Btnlogin(_ sender: Any) {
        
       // self.enableButtonLoging()
        if(self.checkValidField() == true)
        {
            self.ProcessActivity.isHidden = false
            ProcessActivity.startAnimating();
            Btnlogin.setTitleColor(.orange, for: .normal)
            
            if(isConnectedToNetwork() == true)
            {
                print("isConnectedToNetwork is true")
                if(self.checkValidUserLogin(user:self.textRut.text!,pass: self.textPassInt!.text!) == true)
                {
                    if saveDataToCoreData() == true
                    {
                            print("saveDataToCoreData is true")
                         self.ProcessActivity.isHidden = true
                           if self.apiManagerLogs.loginRest(login: self.textRut.text! , password: self.textPassInt.text!) == true
                            {
                                 ProcessActivity.stopAnimating();
                                 self.goToInicio()
                                 print("loginRest is true")
                               
                            }else{
                                    self.ViewAlerts.isHidden = false
                                    self.LblMensajeAlert.text = self.checkTypeMessage(CodeAlert: 1)
                                    self.LblMensajeAlert.numberOfLines = 3
                                    self.LblMensajeAlert.lineBreakMode = .byWordWrapping
                                 print("loginRest is False")
                                ProcessActivity.stopAnimating();
                                Btnlogin.setTitleColor(.white, for: .normal)
                            }
                    }else{
                            self.ViewAlerts.isHidden = false
                            self.LblMensajeAlert.text = self.checkTypeMessage(CodeAlert: 0)
                            self.LblMensajeAlert.numberOfLines = 3
                            self.LblMensajeAlert.lineBreakMode = .byWordWrapping
                            print("saveDataToCoreData is False")
                    }
                    
                }else{
                    self.ViewAlerts.isHidden = false
                    self.LblMensajeAlert.text = self.checkTypeMessage(CodeAlert: 6)
                    self.LblMensajeAlert.numberOfLines = 3
                    self.LblMensajeAlert.lineBreakMode = .byWordWrapping
                    print("isConnectedToNetwork is False")
                }
            }else{
                    self.ViewAlerts.isHidden = false
                    self.LblMensajeAlert.text = self.checkTypeMessage(CodeAlert: 3)
                    self.LblMensajeAlert.numberOfLines = 3
                    self.LblMensajeAlert.lineBreakMode = .byWordWrapping
                    print("isConnectedToNetwork is False")
            }
           
        }else{
            self.ViewAlerts.isHidden = false
            self.LblMensajeAlert.text = self.checkTypeMessage(CodeAlert: 7)
            self.LblMensajeAlert.numberOfLines = 3
            self.LblMensajeAlert.lineBreakMode = .byWordWrapping
            print("checkValidField is False")
        }
    }
    func goToInicio()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCInicio")
        self.present(controller, animated: true, completion: nil)
    }
    func getContext(completion: @escaping (_ contexts: DataLogin?, _ error: Error?) -> Void) {
        getJSONFromURL(urlString: stubDataURL) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completion(nil, error)
            }
            self.createContextObjectWith(json: data, completion: { (contexts, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil, error)
                }
                return completion(contexts, nil)
            })
        }
    }
    
     func getJSONFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: Cannot create URL from string")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        let postString = "{}"
        urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard error == nil else {
                print("Error calling api")
                return completion(nil, error)
            }
            guard let responseData = data else {
                print("Data is nil")
                return completion(nil, error)
            }
            completion(responseData, nil)
        }
        task.resume()
    }
    
     func createContextObjectWith(json: Data, completion: @escaping (_ data: DataLogin?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let contexts = try decoder.decode(DataLogin.self, from: json)
            return completion(contexts, nil)
        } catch let error {
            print("Error creating current contexts from JSON because: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }
    func getDataUserCore()
    {
        /* No existe aun servicio de datos de cliente ,
         por ahora solo ejemplo */
        self.namesUserFromCore = "Mirna"
        self.lastNamesFromCore = "Ortiz"
        self.ideUserFromCore = self.textRut.text!
        
    }
    
    func saveDataToCoreData()-> Bool
    {
        self.getDataUserCore()
        var SavedItem:Bool = false
        
        var mDictionary : [String: Any] =
            [ "names": self.namesUserFromCore,
              "lnames":self.lastNamesFromCore,
              "ide": self.ideUserFromCore
        ]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: mDictionary, options: [.prettyPrinted])
        let json = String(data: jsonData, encoding: String.Encoding.utf8)!
        print(json)
        if self.saveRutSwitchOn
        {
            SecureData.save(key: "dataUser", data: json.data(using: .utf8)!)
        }
        SavedItem = self.saveRutSwitchOn

        //Save CoreData Xcode for TESTING before the real CoreData SDK Latan Brasil
       /* let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Clients", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue("Mirna", forKey: "names")
        newUser.setValue("Ortiz", forKey: "lastNames")
        newUser.setValue(self.textRut.text!, forKey: "ide")
        do {
            try context.save()
            SavedItem = true
            //self.listUsersCoreData()
        } catch {
            SavedItem = false
            print("Failed saving")
        }
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Clients")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "ide") as! String)
            }
        } catch {
            print("Failed")
        }*/
        return SavedItem
    }
    
    func DeleteUsersCoreData()
    {
        
    }
    
    func listUsersCoreData()
    {
        /*let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Clients", in: context)
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Clients")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "username") as! String)
            }
            
        } catch {
            
            print("Failed")
        }
        */
    }
    func isConnectedToNetwork() -> Bool {
        /*
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
       */
        return true
    }
    
    func textField(textField: UITextField,shouldChangeCharactersInRange range: NSRange,replacementString string: String)-> Bool
    {
        if string.characters.count == 0 {
            return true
        }
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        switch textField {
        case textRut:
            return prospectiveText.containsOnlyCharactersIn(matchCharacters: "0123456789K") &&
                prospectiveText.characters.count <= 20
      
        default:
            return true
        }
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    /*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 20
    }*/
    /*
     //controla cantidad caracteres de textfield
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        return changedText.count <= 4
    }*/
    
}



