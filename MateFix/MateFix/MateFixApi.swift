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
    
    private static let hostURL = "http://matefix.herokuapp.com/"
    
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
    
    
}
