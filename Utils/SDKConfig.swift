//
//  SDKConfig.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 01-02-19.
//  Copyright © 2019 Jose Bustos . All rights reserved.
//

import Foundation
import SDKiOSCore

class SDKConfig {
    static func getRouterURL() -> String {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) {
                if let url = dic["router_url"] as? String {
                    return url
                }
            }
        }
        return ""
    }
    
    static func getWebviewURL() -> String {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            if let dic = NSDictionary(contentsOfFile: path) {
                if let url = dic["ITAU_SPA_URL"] as? String {
                    return url
                }
            }
        }
        return ""
    }
    
    static func configureRouter(){
        do{
            let params = [
                Keys.routerPrivateResourcesParam: Keys.routerPrivateURL,
                Keys.routerPublicResourcesParam: Keys.routerPublicURL,
                Keys.webviewResourcesParam: Keys.webviewURL
            ]
            
            try IMBackendClient.shared().setup(params: params)
        }
        catch { print("Couldn't setup router. " + error.localizedDescription) }
    }
    
    static func configureSDK() {
        do {
            try IMAppConfigurator.configureApp(withActivationKey: Keys.activationKey, andLicensePath: Keys.licensePath)
        } catch {
            print("Couldn't load the file. " + error.localizedDescription)
        }
        
    }
}

struct Keys {
    
    static let activationKey = "4a51dfe3b62e8a23"
    static let licensePath = Bundle.main.path(forResource: "mob", ofType: "ilic")
    static let routerParam = "IMSetupRouterURLKey"
    
    static let routerPrivateResourcesParam = "IMSetupRouterURLKey"
    static let routerPublicResourcesParam = "IMSetupPublicURLKey "
    static let webviewResourcesParam = "IMSetupWebviewURLKey"
    static var routerPrivateURL: URL {
        return URL(string: SDKConfig.getRouterURL())!
    }
    
    static var routerPublicURL: URL {
        return URL(string: SDKConfig.getRouterURL())!
    }
    
    static var webviewURL: URL {
        return URL(string: SDKConfig.getWebviewURL())!
    }
    
}

