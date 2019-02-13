//
//  VCWelcome.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 21-12-18.
//  Copyright © 2018 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit

struct MyContextApp: Codable {
    
   let estado: String?
   let mensaje:  String?

    private enum CodingKeys: String, CodingKey {
        case estado
        case mensaje
    }
}

extension UIImageView{
    func addBlackGradientLayer(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        self.layer.addSublayer(gradient)
    }
}
class VCWelcome: UIViewController {
    
    @IBOutlet weak var ImgFondo: UIImageView!
    @IBOutlet weak var ImgLogo: UIImageView!
    @IBOutlet weak var LblWelcome: UILabel!
    @IBOutlet weak var LblDescripcion: UILabel!
    @IBOutlet weak var BtnWelcome: UIButton!
    
   private let apiManager = APIManagerWelcome()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiManager.getContext() { (contexts, error) in
            if let error = error {
                print("Get contexts error: \(error.localizedDescription)")
                return
            }
            guard let contexts = contexts  else { return }
            print("Current contexts Object:")
            DispatchQueue.main.sync {
                            if let gwelcome = contexts.objetoRetorno?.contenidoPantallaUnoDTO?.welcome {
                                print("gwelcome :"+gwelcome)
                                self.LblWelcome.text = gwelcome
                            }
                
                            if let gDescrip = contexts.objetoRetorno?.contenidoPantallaUnoDTO?.descripcion {
                                print("gDescrip :"+gDescrip)
                                self.LblDescripcion.text = gDescrip
                            }
                        }
            
        }
        
        self.LblWelcome.numberOfLines = 5
        self.LblWelcome.lineBreakMode = .byWordWrapping
        self.LblDescripcion.numberOfLines = 32
        self.LblDescripcion.lineBreakMode = .byWordWrapping
      
        //self.loadSetDataWelcome()
        BtnWelcome.layer.cornerRadius = 10
        BtnWelcome.clipsToBounds = true
    }
    
    func loadSetDataWelcome(){
        
        self.apiManager.getContext() { (contexts, error) in
            if let error = error {
                print("Get contexts error: \(error.localizedDescription)")
                return
            }
            guard let contexts = contexts  else { return }
            print("Current contexts Object:")

            if let gwelcome = contexts.objetoRetorno?.contenidoPantallaUnoDTO?.welcome {
                self.LblWelcome.text = gwelcome
            }
            
            if let gDescrip = contexts.objetoRetorno?.contenidoPantallaUnoDTO?.descripcion {
                self.LblDescripcion.text = gDescrip
            }
            //self.LblWelcome.text = contexts.objetoRetorno?.contenidoPantallaUnoDTO?.welcome
            //"Bienvenidos  a la app iToken"
            /*"Tu nuevo Itoken reemplazara a tu tarjeta de coordenadas permitiendote transacionar de manera más segura, simple y sin la necesidad de dispositivos adicionales Son sólo 3 pasos!"*/
            //self.LblPasos.text = "Son sólo 3 pasos!"
        }
        
        self.LblWelcome.numberOfLines = 5
        self.LblWelcome.lineBreakMode = .byWordWrapping
        self.LblDescripcion.numberOfLines = 32
        self.LblDescripcion.lineBreakMode = .byWordWrapping
    }
    
}
