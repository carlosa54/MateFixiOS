//
//  InitialSignUpViewController.swift
//  MateFix
//
//  Created by Carlos on 3/29/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import Alamofire
import UIKit

class InitialSignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    @IBOutlet weak var getStartedButton: DesignableButton!
    var registerEndPoint = "https://matefix.herokuapp.com/users/register"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getStartedButton(sender: DesignableButton) {
        
        getStartedButton.enabled = false
        PKNotification.loading(true)  // show loading view.
        self.view.userInteractionEnabled = false
        var email = emailTextField.text
        var password = passwordTextField.text
        
        
        var params = ["email":email, "password":password] as Dictionary<String,String>
        
        
        
        
        Alamofire.request(.POST , registerEndPoint, parameters: params, encoding: .JSON )
            .responseJSON { (request, response, data, error) in
                if let anError = error
                {
                    // got an error in getting the data, need to handle it
                    println("error calling POST")
                    println(error)
                }
                else if let data: AnyObject = data
                {
                    // handle the results as JSON, without a bunch of nested if loops
                    let post = JSON(data)
                    // to make sure it posted, print the results
                    println("The post is: " + post.description)
                    
                    PKNotification.loading(false) // hide loading view.
                    self.view.userInteractionEnabled = true
                    self.performSegueWithIdentifier("verificationCodeSegue", sender: nil)
                }
        
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
