//
//  SecureData.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 01-02-19.
//  Copyright © 2019 Jose Bustos . All rights reserved.
//

import Foundation
import SDKiOSCore

final public class SecureData {
    
    /// Save data by a key into UserDefaults.
    ///
    /// - Parameters:
    ///   - key: This key will be the identifier to manage the saved data
    ///   - data: Data to be saved in UserDefaults.
    public static func save(key: String, data: Data) {
        var error: NSError?
        IMUserSecureSetLocalObject(key, data, &error)
    }
    
    /// Load data that was previously saved in UserDefaults
    ///
    /// - Parameter key: This key will be the identifier to manage the saved data
    /// - Returns: It will return data if the key exists in UserDefaults.
    public static func load(key: String) -> Data? {
        var error: NSError?
        if exists(key: key) {
            return IMUserSecureObjectForKey(key, &error)
        }
        
        return nil
    }
    
    /// Remove the key was previously saved
    ///
    /// - Parameter key: This key will be the identifier to manage the saved data
    public static func remove(key: String) {
        var error: NSError?
        if exists(key: key) {
            IMUserSecureRemoveForKey(key, &error)
        }
    }
    
    /// This method will ask to UserDefaults if the key exists
    ///
    /// - Parameter key: This key will be the identifier to manage the saved data
    /// - Returns: It returns true if exists otherwise it will response false.
    public static func exists(key: String) -> Bool {
        var error: NSError?
        return IMUserSecureObjectForKey(key, &error) != nil ? true : false
    }
    
}
