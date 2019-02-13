//
//  APILoginManager.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 17-01-19.
//  Copyright © 2019 Jose Bustos . All rights reserved.
//

import Foundation

public class APILoginManager
{
    let stubDataURL = "http://localhost:8080/app-empresa/login"
    
    func getContex(completion: @escaping (_ contexts: DataLogin?, _ error: Error?) -> Void) {
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

extension APILoginManager {
    private func getJSONFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: Cannot create URL from string")
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        let postString = ""
        
        let stringJson: [String: Any] = [
            "data": [
                "context": [
                    "channel_id": "08 ",
                    "application": "super-app",
                    "timestamp": "12-12-2018T12:12:12"
                ],
                "application_data":[
                    "application_type": "V.2 Mobile",
                    "application_version": "V1"
                ],
                "client_credentials":[
                    "client_id": "52009612",
                    "password": "certi147"
                ]
            ]
        ]
        let jsonData = try! JSONSerialization.data(withJSONObject: stringJson, options: [.prettyPrinted])
        let datos = String(data: jsonData, encoding: String.Encoding.utf8)!
        print(datos)
        urlRequest.httpBody = (datos.data(using: String.Encoding.utf8))
        
        //urlRequest.httpBody = postString.data(using: String.Encoding.utf8)
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
    
    private func createContextObjectWith(json: Data, completion: @escaping (_ data: DataLogin?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let contexts = try decoder.decode(DataLogin.self, from: json)
            return completion(contexts, nil)
        } catch let error {
            print("Error creating current contexts from JSON because: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }
}
