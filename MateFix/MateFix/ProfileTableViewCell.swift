//
//  ProfileTableViewCell.swift
//  MateFix
//
//  Created by Carlos on 5/4/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    var user: User?{
        didSet{
            updateUI()
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var starRating: TegStarRatingView!
    @IBOutlet weak var profilePicImage: UIImageView!
    
    func updateUI(){
        
        nameLabel?.text = nil
        addressLabel?.text = nil
        createdAtLabel?.text = nil
        
        if let user = user {
            nameLabel?.text = "\(user.firstName!) \(user.lastName!)"
            addressLabel?.text = "\(user.city!), \(user.country!)"
            createdAtLabel?.text = "\(user.createdAt!)"
            starRating.show(rating: Double(user.overallRating!))
            println(user.firstName!)
            
            if let profileImage = self.user?.profilePic {
                if let imageData = NSData(contentsOfURL: profileImage){
                    //blocks main queue
                    profilePicImage?.image = UIImage(data: imageData)
                }
            } else {
                profilePicImage?.image = UIImage(named: "MateFixLogo2@1x")
            }
        }
        
        
        
    }

}

// MARK: - AboutTableViewCell class
class AboutTableViewCell: UITableViewCell {

    var user : User?{
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var aboutMe: UILabel!
    
    func updateUI(){
        aboutMe.text = nil
        if let user = user{
            aboutMe.text = user.aboutMe!
        }
    }



}

class SkillsTableViewCell: UITableViewCell {
    
    var user: User? {
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var skills: UILabel!
    
    func updateUI(){
        skills.text = "Loading..." // Needs to be updated with real skills
    }
    
    
}

class ReviewTableViewCell: UITableViewCell {
    var user:User? {
        didSet{
        updateUI()
        }
    }
    
    func updateUI(){
        
    }
}


