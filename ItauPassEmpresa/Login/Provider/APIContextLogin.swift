//
//  APIContextLogin.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 16-01-19.
//  Copyright © 2019 Jose Bustos . All rights reserved.
//

import UIKit
import Foundation
class APIContextLogin {
    let stubDataURL = "http://localhost:8080/app-empresa/servicioContenido/getContenidos"
    
    func getContext(completion: @escaping (_ contexts: ContextApp?, _ error: Error?) -> Void) {
        getJSONFromURL(urlString: stubDataURL) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completion(nil, error)
            }
            self.createContextObjectWith(json: data, completion: { (contexts, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil, error)
                }
                return completion(contexts, nil)
            })
        }
    }
    
}

extension APIContextLogin {
    private func getJSONFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: Cannot create URL from string")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        let postString = "{}"
        urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard error == nil else {
                print("Error calling api")
                return completion(nil, error)
            }
            guard let responseData = data else {
                print("Data is nil")
                return completion(nil, error)
            }
            completion(responseData, nil)
        }
        task.resume()
    }
    
    private func createContextObjectWith(json: Data, completion: @escaping (_ data: ContextApp?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let contexts = try decoder.decode(ContextApp.self, from: json)
            return completion(contexts, nil)
        } catch let error {
            print("Error creating current contexts from JSON because: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }
}

