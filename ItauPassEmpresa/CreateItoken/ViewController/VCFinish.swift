//
//  VCFinish.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 21-12-18.
//  Copyright © 2018 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit

class VCFinish: UIViewController {
    
   
    @IBOutlet weak var LblTitle: UILabel!
    @IBOutlet weak var LblDescription: UILabel!
    // @IBOutlet weak var LblDescrip: UILabel!
   // @IBOutlet weak var LblPIN: UILabel!
   // @IBOutlet weak var LblDescripPin: UILabel!
    @IBOutlet weak var BtnBeginApp: UIButton!
    private let apiManager = APIGlobalProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadSetDataFinish()
        // Do any additional setup after loading the view, typically from a nib.
        self.SetDesignObject()
    }
    func SetDesignObject()
    {
        BtnBeginApp.layer.cornerRadius = 10
        BtnBeginApp.clipsToBounds = true
    }
    
    func loadSetDataFinish(){
    
        self.apiManager.getContext() { (contexts, error) in
            if let error = error {
                print("Get contexts error: \(error.localizedDescription)")
                return
            }
            guard let contexts = contexts  else { return }
            print("Current contexts Object:")
            DispatchQueue.main.sync {
                if let gtitle = contexts.objetoRetorno?.contenidoPantallaFinishDTO?.title {
                    print("gtitle :"+gtitle)
                    self.LblTitle.text = gtitle
                }
                
                if let gDescrip = contexts.objetoRetorno?.contenidoPantallaFinishDTO?.description {
                    print("gDescrip :"+gDescrip)
                    self.LblDescription.text = gDescrip
                }
            }
            
        }
        //self.LblTitle.text = "Tu PIN ha sido creado correctamente"
        self.LblTitle.numberOfLines = 3
        self.LblTitle.lineBreakMode = .byWordWrapping
        
       // self.LblDescription.text = "Ya puedes gestionar tus transacciones de manera rápida , sencilla y segura desde tu APP iToken"
        self.LblDescription.numberOfLines = 5
        self.LblDescription.lineBreakMode = .byWordWrapping
    }
    func checkValidField() -> Bool {
        let checkValid = true
        return checkValid
    }
}
