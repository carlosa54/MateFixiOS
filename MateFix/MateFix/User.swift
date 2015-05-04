//
//  User.swift
//  MateFix
//
//  Created by Carlos on 4/20/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import Alamofire

final class User : ResponseObjectSerializable, ResponseCollectionSerializable {
    
    var id: Int?
    var email: String?
    var password: String?
    var firstName: String?
    var lastName: String?
    var aboutMe: String?
    var country: String?
    var city: String?
    var zipCode: String?
    var profilePic: String?
    var overallRating: Float?
    var createdAt: NSDate?
    
    init(){
        
    }
    
    init(email: String, password: String){
        self.email = email
        self.password = password
    }
    
    @objc required init?(response: NSHTTPURLResponse, representation: AnyObject) {
        self.id = representation.valueForKey("id") as? Int
        self.email = representation.valueForKey("email") as? String
        self.password = representation.valueForKey("password") as? String
        self.firstName = representation.valueForKey("first_name") as? String
        self.lastName = representation.valueForKey("last_name") as? String
        self.aboutMe = representation.valueForKey("about_me") as? String
        self.country = representation.valueForKey("country") as? String
        self.city = representation.valueForKey("city") as? String
        self.zipCode = representation.valueForKey("zip_code") as? String
        self.profilePic = representation.valueForKey("profile_pic") as? String
        self.overallRating = representation.valueForKey("overall_rating") as? Float
        self.createdAt = representation.valueForKey("created_at") as? NSDate
    }
    
    init(id: Int, email: String, password: String, firstName: String, lastName: String, aboutMe: String, country: String, city: String, zipCode: String, profilePic: String, overallRating: Float, createdAt: NSDate){
        
        self.id = id
        self.email = email
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.aboutMe = aboutMe
        self.country = country
        self.city = city
        self.zipCode = zipCode
        self.profilePic = profilePic
        self.overallRating = overallRating
        self.createdAt = createdAt
    }
    
    func toDictionary() -> Dictionary<String, String> {
        
        var dic = ["email":email!, "password":password!] as Dictionary<String, String>

       return dic
    }
    
    @objc static func collection(#response: NSHTTPURLResponse, representation: AnyObject) -> [User] {
        var users = [User]()
        for usersRep in representation.valueForKeyPath("results") as! [AnyObject] {
            users.append(User(response: response, representation: usersRep)!)
        }
        return users
    }
    
    
    

    
}
