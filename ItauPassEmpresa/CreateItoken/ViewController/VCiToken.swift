//
//  VCiToken.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 21-12-18.
//  Copyright © 2018 Jose Bustos . All rights reserved.
//

import Foundation
import UIKit

class VCiToken: UIViewController {
    
    @IBOutlet weak var LblAproved: UILabel!
    @IBOutlet weak var LblDescription: UILabel!
    @IBOutlet weak var textToken: UITextField!
    @IBOutlet weak var BtnValidToken: UIButton!
    @IBOutlet weak var ViewAlertMessage: UIView!
    @IBOutlet weak var ProcessActivity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadSetDataiToken()
        self.SetDesignObject()
        self.HideViewMessage()
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
    func HideViewMessage()
    {
        self.ViewAlertMessage.isHidden = true
    }
    func SetDesignObject()
    {
        BtnValidToken.layer.cornerRadius = 10
        BtnValidToken.clipsToBounds = true
    }
    
    @IBAction func BtnBack(_ sender: Any) {
        if checkRemoveItemCore() == true
        {
           self.goToLogin()
        }else{
             print("checkRemoveItemCore is false")
        }
    }
    func goToLogin()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCLogin")
        self.present(controller, animated: true, completion: nil)
    }
    func goToCreatePin()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "VCCreatePin")
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func BtnValidToken(_ sender: Any) {
        
        // valida conection a internet
        if checkInternetConnection() == true
        {
            // valida Token
            if checkValidToken() == true
            {
                // valida campos validos
                if checkValidField()  == true {
                    self.goToCreatePin()
                }else{
                   print("checkValidField is false")
                }
            }else{
                print("checkValidToken is false")
            }
        }else{
            print("checkInternetConnection is false")
        }
    }
    func loadSetDataiToken(){
        self.LblDescription.text = "Ahora ingresa los números de tu token xxxx - x6382"
        self.LblDescription.numberOfLines = 3
        self.LblDescription.lineBreakMode = .byWordWrapping
    }
    func checkInternetConnection() -> Bool {
        var checkInternet = true
        
        
        return checkInternet
    }
    func checkRemoveItemCore() -> Bool {
        var checkRemove = true
        
        
        return checkRemove
    }
    func checkValidToken() -> Bool {
        var checkValidToken = true
        
        
        return checkValidToken
    }
    func checkValidField() -> Bool {
        var checkValid = true
        if self.textToken.text?.isEmpty ?? true
        {
            checkValid = false
            return checkValid
        }
        return checkValid
    }
}
