//
//  VCBlockedDevice.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 07-02-19.
//  Copyright © 2019 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit

class VCBlockedDevice: UIViewController {
    
    @IBOutlet weak var LblDescr: UILabel!
    @IBOutlet weak var LblContext: UILabel!
    @IBOutlet weak var LblCaller: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.loadDataSet()
        // Datos 
        // Do any additional setup after loading the view, typically from a nib.
    }
    func loadDataSet()
    {
        let codErrScrn:String = "ERRBLOK"
        
        switch codErrScrn {
            case "ERRBLOK":
                loadDataContextBlock(code:codErrScrn)
            case "ERRNOT":
                loadDataContextBlock(code:codErrScrn)
            case "ERRINT":
                loadDataContextBlock(code:codErrScrn)
            default:
                loadDataContextBlock(code:codErrScrn)
        }
    }
    func loadDataContextBlock(code:String){
        
        switch code {
        case "ERRBLOK":
            self.LblDescr.text = "Tus dispositivos de seguridad estan bloqueados."
            self.LblDescr.numberOfLines = 3
            self.LblDescr.lineBreakMode = .byWordWrapping
            
            self.LblContext.text = "Para poder continuar necesitas dispositivo de seguridad activos y tus dispositivos se encuentran bloqueados."
            self.LblContext.numberOfLines = 3
            self.LblContext.lineBreakMode = .byWordWrapping
            
            self.LblCaller.text = "Por favor llamanos a 600 686 0888 para desbloquearlos."
            self.LblCaller.numberOfLines = 3
            self.LblCaller.lineBreakMode = .byWordWrapping
            
        case "ERRNOT":
            self.LblDescr.text = "Ops! no encontramos dispositivos de seguridad."
            self.LblDescr.numberOfLines = 3
            self.LblDescr.lineBreakMode = .byWordWrapping
            
            self.LblContext.text = "Para poder continuar necesitas contar con tarjeta de transferencia o token y no registras dispositivos de seguridad."
            self.LblContext.numberOfLines = 3
            self.LblContext.lineBreakMode = .byWordWrapping
            
            self.LblCaller.text = "Por favor llamanos a 600 686 0888 para obtener mas información."
            self.LblCaller.numberOfLines = 3
            self.LblCaller.lineBreakMode = .byWordWrapping
            
        default:
            self.LblDescr.text = "Tus dispositivos de seguridad estan bloqueados."
            self.LblDescr.numberOfLines = 3
            self.LblDescr.lineBreakMode = .byWordWrapping
            
            self.LblContext.text = "Para poder continuar necesitas dispositivo de seguridad activos y tus dispositivos se encuentran bloqueados."
            self.LblContext.numberOfLines = 3
            self.LblContext.lineBreakMode = .byWordWrapping
            
            self.LblCaller.text = "Por favor llamanos a 600 686 0888 para desbloquearlos."
            self.LblCaller.numberOfLines = 3
            self.LblCaller.lineBreakMode = .byWordWrapping
        }
    }
    func verifyTypeMessage(CodError:String) -> Int
    {
        var codType:Int = 0
        
        switch CodError {
            case "ERRBLOK":
            codType = 1
            case "ERRNOT":
            codType = 2
            default:
            codType = 0
        }
        return codType
    }
}
