//
//  AppErrors.swift
//  ItauPassEmpresa
//
//  Created by Jose Bustos  on 22-01-19.
//  Copyright © 2019 Jose Bustos . All rights reserved.
//

import UIKit
import Foundation
class AppErrors {
    public func ctrlErrorPin(codApp:String ,lang:String)-> String
    {
        var str_error:String = "error test"
        if (lang == "ESP")
        {
            switch codApp
            {
            case "0000":
                str_error = "Tus Datos no son los correctos, intentalo nuevamente"
                break;
            case  "0001":
                str_error = "Acceso exclusivo para clientes Empresas,descarga tu App Itaú Chile o Itaú Personal Bank"
                break;
            case  "0002":
                str_error = "Tienes poca señal de internet revisa tu conexión y vuelve a intentarlo más tarde"
                break;
            case  "0003":
                str_error = "Hemos bloqueado tu clave por tu seguridad , Llamanos al +5622686 0888 o ingresa a www.itau.cl para solucionarlo"
                break;
            case  "0004":
                str_error = "Disculpa , estamos teniendo problemas técnicos . intenta ingresar más tarde."
                break;
            case  "0005":
                str_error = "Rut o Password incorrecto, favor intentar nuevamente."
                break;
            case  "0006":
                str_error = "Rut o Password vacios, favor intentar nuevamente."
                break;
            case  "0007":
                str_error = "Tus Datos no son los correctos,inténlalo nuevamente."
                break;
            default:
                str_error = "Error de conexión o aplicación , favor intentar nuevamente"
                break;
            }
        }
        return str_error
    }
    public func ctrlErrorLogin (codApp:String)-> String
    {
        var str_error:String = "error test"
        
        switch codApp
        {
        case "0000":
            str_error = "Tus Datos no son los correctos, intentalo nuevamente"
            break;
        case  "0001":
            str_error = "Acceso exclusivo para clientes Empresas,descarga tu App Itaú Chile o Itaú Personal Bank"
            break;
        case  "0002":
            str_error = "Tienes poca señal de internet revisa tu conexión y vuelve a intentarlo más tarde"
            break;
        case  "0003":
            str_error = "Hemos bloqueado tu clave por tu seguridad , Llamanos al +5622686 0888 o ingresa a www.itau.cl para solucionarlo"
            break;
        case  "0004":
            str_error = "Disculpa , estamos teniendo problemas técnicos . intenta ingresar más tarde."
            break;
        case  "0005":
            str_error = "Rut o Password incorrecto, favor intentar nuevamente."
            break;
        case  "0006":
            str_error = "Rut o Password vacios, favor intentar nuevamente."
            break;
        case  "0007":
            str_error = "Tus Datos no son los correctos,inténlalo nuevamente."
            break;
        default:
            str_error = "Error de conexión o aplicación , favor intentar nuevamente"
            break;
        }
        
        return str_error
    }
    
    public func ctrlErrorApp (codApp:String)-> String
    {
        var str_error:String = "error test"
        
        switch codApp
        {
        case "0011":
            str_error = "Tus Datos no son los correctos, intentalo nuevamente"
            break;
        case  "0012":
            str_error = "Acceso exclusivo para clientes Empresas,descarga tu App Itaú Chile o Itaú Personal Bank"
            break;
        case  "0013":
            str_error = "Tienes poca señal de internet revisa tu conexión y vuelve a intentarlo más tarde"
            break;
        case  "0014":
            str_error = "Hemos bloqueado tu clave por tu seguridad , Llamanos al +5622686 0888 o ingresa a www.itau.cl para solucionarlo"
            break;
        case  "0015":
            str_error = "Disculpa , estamos teniendo problemas técnicos . intenta ingresar más tarde."
            break;
        
        case  "0016":
            str_error = "Tus Datos no son los correctos,inténlalo nuevamente."
            break;
        default:
            str_error = "Error de conexión o aplicación , favor intentar nuevamente"
            break;
        }
        return str_error
    }
}
