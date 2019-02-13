//
//  User.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 02-01-19.
//  Copyright © 2019 Jose Bustos . All rights reserved.
//

import Foundation
/*
 [{
 "user": {
 "id": 18977,
 "ide": "12669078-3",
 "names": "Mirna",
 "lastnames": "Ortiz Lopez",
 "age": 38,
 "address": "av Maratton 278 , comuna Macul",
 "city": "Santiago",
 "email": "mirna.1980@gmail.com",
 "phone": "56 9 6785 4536",
 "phone_aux": "56 9 6785 4536",
 "state": true,
 "type_user": "premium",
 "companies": [{
                 "id": 1290,
                 "ide": "78669078-3",
                 "names": "KAZ S.A",
                 "address": "Av providencia 1290 , comuna providencia",
                 "city": "Santiago",
                 "email": "soporteIT@kaz.cl",
                 "phone": "56 22 785 4536",
                 "type": "SLTDA",
                 "state": true
                 }
 ],
 "pyme": [{
                 "cod": 101,
                 "ide": "78669078-3",
                 "name": "Escobas Mujer Ltda",
                 "address": "San Pablo 1290 , comuna Quinta Normal",
                 "city": "Santiago",
                 "email": "soporteIT@escobasmujer.cl",
                 "phone": "56 22 785 2390",
                 "type": "ABAR",
                 "state": true
                 },
                 {
                 "cod": 102,
                 "ide": "78669078-3",
                 "name": "Karma Ltda",
                 "address": "San Pablo 1290 , comuna Quinta Normal",
                 "city": "Santiago",
                 "email": "soporteIT@karma.cl",
                 "phone": "56 22 785 8966",
                 "type": "PERF",
                 "state": true
                 }
                 ]
 }
 }]
 */
typealias Users = [User]

struct User: Codable {
    let user: UserClass
}

struct UserClass: Codable {
    let id: Int
    let ide, names, lastnames: String
    let age: Int
    let address, city, email, phone: String
    let phoneAux: String
    let state: Bool
    let typeUser: String
    let companies, pyme: [Company]
    
    enum CodingKeys: String, CodingKey {
        case id, ide, names, lastnames, age, address, city, email, phone
        case phoneAux = "phone_aux"
        case state
        case typeUser = "type_user"
        case companies, pyme
    }
}

struct Company: Codable {
    let id: Int?
    let ide: String
    let names: String?
    let address, city, email, phone: String
    let type: String
    let state: Bool
    let cod: Int?
    let name: String?
}

