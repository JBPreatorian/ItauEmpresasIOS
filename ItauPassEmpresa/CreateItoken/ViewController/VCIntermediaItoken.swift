//
//  VCIntermediaItoken.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 21-01-19.
//  Copyright © 2019 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit

class VCIntermediaItoken: UIViewController,UITextFieldDelegate  {
   // @IBOutlet weak var labelMensageError: UILabel!
    
    @IBOutlet weak var labelMensageError: UILabel!
   // @IBOutlet weak var textCodActive: UITextField!
    
    @IBOutlet weak var textCodActive: UITextField!
    @IBOutlet weak var textNumSerie: UITextField!
    
    @IBOutlet weak var textEntityName: UITextField!

    var strMensage:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelMensageError.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func BtnEnrolItoken(_ sender: Any) {
        
        if checkValidField() == true
        {
            self.labelMensageError.isHidden = true
            self.enrolItoken()
        }else{
            self.labelMensageError.isHidden = false
            self.labelMensageError.text = self.strMensage
        }
        
        
    }
    func goToCreatePin()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCCreatePin")
        self.present(controller, animated: true, completion: nil)
    }
    func goToWithPin()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCCreatePin")
        self.present(controller, animated: true, completion: nil)
    }
    private func enrolItoken()
    {
        if verifyPinCore() == false
        {
            self.goToWithPin()
        }else{
            self.goToCreatePin()
        }
        
    }
    func verifyPinCore()->Bool
    {
        let pinLocal = true
        
        
        return pinLocal
    }
    func checkValidField() -> Bool {
        var checkfield = true
        
        if self.textCodActive.text?.isEmpty ?? true
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
        if self.textEntityName.text?.isEmpty ?? true
        {
            checkfield = false
            self.strMensage = "Falta Nombre Entidad"
            return checkfield
            
        }
        return checkfield
    }
    
    
    
    
    
}
