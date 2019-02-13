//
//  VCMenuItoken.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 21-12-18.
//  Copyright © 2018 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit

class VCMenuItoken: UIViewController {
    
    @IBOutlet weak var LblTitle: UILabel!
    @IBOutlet weak var LblDescription: UILabel!
    @IBOutlet weak var LblDescripNew: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadSetData()
        self.SetLoadContext()
    }
    func SetLoadContext()
    {
        
        self.LblTitle.text = "Hola!"
        self.LblTitle.numberOfLines = 3
        self.LblTitle.lineBreakMode = .byWordWrapping
        
        self.LblDescription.text = "Selecciona el iToken del apoderado o pyme que quieras usar en éste momento"
        self.LblDescription.numberOfLines = 3
        self.LblDescription.lineBreakMode = .byWordWrapping
        
        self.LblDescripNew.text = "Agregar nueva empresa o pyme"
        self.LblDescripNew.numberOfLines = 3
        self.LblDescripNew.lineBreakMode = .byWordWrapping
    }
    @IBAction func BtnBack(_ sender: Any) {
        goToLoginItoken()
    }
    
    @IBAction func BtnNewEntity(_ sender: Any) {
        goToLoginApp()
    }
    func goToLoginItoken()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCWelcomeItoken")
        self.present(controller, animated: true, completion: nil)
    }
    func goToLoginApp(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCLogin")
        self.present(controller, animated: true, completion: nil)
    }
    func loadSetData(){
        
    }
    func checkValidField() -> Bool {
        let checkValid = true
        return checkValid
    }
    
}
