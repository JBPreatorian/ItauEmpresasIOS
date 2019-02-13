//
//  VCIntermediaEnrolar.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 22-01-19.
//  Copyright © 2019 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit

class VCIntermediaEnrolar: UIViewController {
    
    @IBOutlet weak var textCodActivation: UITextField!
    @IBOutlet weak var textNameEntity: UITextField!
    @IBOutlet weak var textNumSerie: UITextField!
    var strMensage:String = ""
   public var strURL:String = "/"
    
    @IBOutlet weak var LblErrorEnrole: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.LblErrorEnrole.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func checkValidField() -> Bool {
        var checkfield = true
        
        if self.textCodActivation.text?.isEmpty ?? true
        {
            checkfield = false
            self.strMensage = "Falta Codigo Activacion"
            return checkfield
            
        }
        if self.textNumSerie.text?.isEmpty ?? true
        {
            checkfield = false
            self.strMensage = "Falta Numero de Serie"
            return checkfield
        }
        if self.textNameEntity.text?.isEmpty ?? true
        {
            checkfield = false
            self.strMensage = "Falta Nombre Entidad"
            return checkfield
            
        }
        
        if self.strURL.isEmpty ?? true
        {
            checkfield = false
            self.strMensage = "URL Error"
            return checkfield
            
        }
        return checkfield
    }
    
    
    @IBAction func BtnEnrolar(_ sender: Any) {
        if checkValidField() == true {
            self.LblErrorEnrole.isHidden = true
            if verifyPinCoreData() == true
            {
                self.goToHavePIN()
            }else{
                if self.EnrolData() == true
                {
                   self.goToCreatePin()
                }else{
                    self.ErrorEnrol()
                }
            }
        }else{
            self.LblErrorEnrole.isHidden = false
            self.LblErrorEnrole.text = self.strMensage
            self.LblErrorEnrole.numberOfLines = 3
            self.LblErrorEnrole.lineBreakMode = .byWordWrapping
        }
        
    }
    func ErrorEnrol()
    {
        self.LblErrorEnrole.isHidden = false
        self.strMensage = "Ocurrio Error Enrolando"
        self.LblErrorEnrole.text = self.strMensage
        self.LblErrorEnrole.numberOfLines = 3
        self.LblErrorEnrole.lineBreakMode = .byWordWrapping

    }
    func EnrolData()->Bool
    {
        let verifyData = true
        
        
        
        
        
        return verifyData
    }
    func verifyPinCoreData()->Bool
    {
        let verifyData = false
        
        
        
        
        
        return verifyData
    }
    
    func goToHavePIN()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCWelcomeItoken")
        self.present(controller, animated: true, completion: nil)
    }
    
    func goToCreatePin()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCCreatePin")
        self.present(controller, animated: true, completion: nil)
    }
}
