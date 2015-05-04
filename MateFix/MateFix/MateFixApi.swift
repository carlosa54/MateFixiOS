//
//  MateFixApi.swift
//  MateFix
//
//  Created by Carlos on 4/17/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import Alamofire

struct MatefixApi {
    
    // Doc: http://matefix.herokuapp.com/docs/
    
    private static let hostURL = "http://matefix.herokuapp.com"
    
    private enum Paths: Printable {
        case Token
        case User
        case Register
        case GetUserInfo
        case UserEdit
        case UserPasswordEdit
        
        var description: String{
            switch self{
            case .Token: return "/oauth/token"
            case .User: return "/users"
            case .Register : return "/users/register"
            case .GetUserInfo : return "users/me"
            case .UserEdit: return "users/edit/me"
            case .UserPasswordEdit: return "users/edit/me/pass"
            }
        }
    }
    
    
    
    
//    static func signUpUser(email: String ,_ password: String) {
//        var usuario = User(email: email, password: password)
//        let registerEndPoint = hostURL + Paths.Register.description
//
//        println(registerEndPoint)
//        
//        Alamofire.request(.POST , registerEndPoint, parameters: usuario.toDictionary())
//            .responseObject { (request, response, user: User?, error) in
//                if let anError = error
//                {
//                    // got an error in getting the data, need to handle it
//                    println("error calling POST")
//                    println(error)
//                }
//                else if let user: User = user
//                {
//                    // to make sure it posted, print the results
//                    println(user.email)
//                }
//        }
//    }
}

