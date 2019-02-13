//
//  VCInicio.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 21-12-18.
//  Copyright © 2018 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit
import CoreData
class VCInicio: UIViewController {
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var LblGreetingName: UILabel!
    @IBOutlet weak var LblNivelOne: UILabel!
    @IBOutlet weak var LblNivelItemTwo: UILabel!
    @IBOutlet weak var LblNivelThree: UILabel!
    @IBOutlet weak var LblCallHelp: UILabel!
    @IBOutlet weak var LblCallHelpfooter: UILabel!
    @IBOutlet weak var BtnBack: UIButton!
    @IBOutlet weak var BtnContinuar: UIButton!
    
    private let apiManager = APIGlobalProvider()
    var strMensage:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadSetDataInicio()
        self.loadSetDataText()
        self.SetDesignObject()

    }
    func SetDesignObject()
    {
        BtnBack.layer.cornerRadius = 10
        BtnBack.clipsToBounds = true
        BtnContinuar.layer.cornerRadius = 10
        BtnContinuar.clipsToBounds = true
    }
    
    @IBAction func BtnBack(_ sender: Any) {
        if self.deleteRecords() == true {
            //self.listItemsCoreData()
            self.goToLogin()
        }else{
            self.strMensage = ctrlErrorInicio(codErr:"ERRDLT")
            self.showErrorMessages(strMessage:self.strMensage)
        }
    }
    func ctrlErrorInicio(codErr:String) -> String
    {
        var strError = ""
        switch codErr
        {
        case "INTCHK":
            strError = "Tienes poca señal de internet revisa tu conexión y vuelve a intentarlo más tarde"
            self.showErrorMessages(strMessage:strError)
        case "ERRINI":
            strError = "Ha ocurrido un error en dispositivo"
            self.showErrorMessages(strMessage:strError)
        case "ERRLOA":
            strError = "Ha ocurrido un error contenido"
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
    @IBAction func BtnContinuar(_ sender: Any) {
        if checkValidField() == true
        {
            // va a la pantalla demo entrust sin lock&feel
            //self.goToIntermedia()
            // va a la pantalla SMS Phone
            self.goToSMSphone()
        }else{
            self.strMensage = ctrlErrorInicio(codErr:"ERRDLT")
        self.showErrorMessages(strMessage:self.strMensage)
        }
    }
    func goToIntermedia()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCIntermediaEnrolar")
        self.present(controller, animated: true, completion: nil)
    }
    func goToLogin()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCLogin")
        self.present(controller, animated: true, completion: nil)
    }
    func goToSMSphone()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCsmsphone")
        self.present(controller, animated: true, completion: nil)
    }
    func loadSetDataInicio(){
        
    }
    
    func loadSetDataText(){
        
        self.apiManager.getContext() { (contexts, error) in
            if let error = error {
                print("Get contexts error: \(error.localizedDescription)")
                return
            }
            guard let contexts = contexts  else { return }
            print("Current contexts Object:")
            DispatchQueue.main.sync {
                if let ghola = contexts.objetoRetorno?.contenidoPantallaBienvenidosDTO?.name {
                    print("ghola :"+ghola)
                    self.LblGreetingName.text = ghola
                }
                
                if let gNivelOne = contexts.objetoRetorno?.contenidoPantallaBienvenidosDTO?.nivelUno {
                    print("gNivelOne :"+gNivelOne)
                    self.LblNivelOne.text = gNivelOne
                }
                
                if let gNivelTwo = contexts.objetoRetorno?.contenidoPantallaBienvenidosDTO?.nivelUno {
                    print("gNivelTwo :"+gNivelTwo)
                    self.LblNivelItemTwo.text = "Corrobora que esté correcto"
                }
                
                if let gNivelThree = contexts.objetoRetorno?.contenidoPantallaBienvenidosDTO?.nivelTres {
                    print("gNivelThree :"+gNivelThree)
                    self.LblNivelThree.text = gNivelThree
                }
                
                if let gNivelHelp = contexts.objetoRetorno?.contenidoPantallaBienvenidosDTO?.callHelp {
                    print("gNivelHelp :"+gNivelHelp)
                    self.LblCallHelp.text = gNivelHelp
                }
                
                if let gNivelHelpFoo = contexts.objetoRetorno?.contenidoPantallaBienvenidosDTO?.callHelpFooter {
                    print("gNivelHelpFoo :"+gNivelHelpFoo)
                    self.LblCallHelpfooter.text = gNivelHelpFoo
                }
            }
            
        }
        
        //self.LblGreetingName.text = "Hola"
        //self.LblNivelOne.text = "Para configurar tu iToken necesitas tener tu teléfono actualizado"
        self.LblNivelOne.numberOfLines = 3
        self.LblNivelOne.lineBreakMode = .byWordWrapping
        
        //self.LblNivelItemTwo.text = "Corrobora que esté correcto"
        self.LblNivelItemTwo.numberOfLines = 3
        self.LblNivelItemTwo.lineBreakMode = .byWordWrapping
        
        //self.LblNivelThree.text = "Teléfono: +56 9 5689 2234"
        self.LblNivelThree.numberOfLines = 3
        self.LblNivelThree.lineBreakMode = .byWordWrapping
        
        //self.LblCallHelp.text = "Si no es asi , llámanos al"
        self.LblCallHelp.numberOfLines = 3
        self.LblCallHelp.lineBreakMode = .byWordWrapping
        
        //self.LblCallHelpfooter.text = "para resolverlo."
        self.LblCallHelpfooter.numberOfLines = 3
        self.LblCallHelpfooter.lineBreakMode = .byWordWrapping
    
    }
    
    func checkValidField() -> Bool {
        var checkValid = true
        
        if self.LblNivelOne.text?.isEmpty ?? true
        {
            checkValid = false
            
            return checkValid
        }
        if self.LblNivelItemTwo.text?.isEmpty ?? true
        {
            checkValid = false
            
            return checkValid
        }
        if self.LblNivelThree.text?.isEmpty ?? true
        {
            checkValid = false
            
            return checkValid
        }
        if self.LblCallHelp.text?.isEmpty ?? true
        {
            checkValid = false
            
            return checkValid
        }
        if self.LblCallHelpfooter.text?.isEmpty ?? true
        {
            checkValid = false
            
            return checkValid
        }
        return checkValid
    }
    
    func deleteRecords() -> Bool {
        var deleteRecords = true
       /* let moc = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Clients")
        
        let result = try? moc.fetch(fetchRequest)
        let resultData = result as! [Clients]
        
        for object in resultData {
            moc.delete(object)
        }
        */
        do {
           // try moc.save()
           // print("saved!")
            deleteRecords = true
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
            deleteRecords = false
        } catch {
            
        }
        return deleteRecords
    }
    
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func listItemsCoreData()
    {
        
        let request2 = NSFetchRequest<NSFetchRequestResult>(entityName: "Clients")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        request2.returnsObjectsAsFaults = false
        
        do {
            print("Deleting items")
            let result2 = try context.fetch(request2)
            for data2 in result2 as! [NSManagedObject] {
                print(data2.value(forKey: "ide") as! String)
            }
            
        } catch {
            print("Failed")
        }
    }
}
