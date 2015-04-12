//
//  LoginViewController.swift
//  MateFix
//
//  Created by Christian Rivera on 3/20/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    @IBOutlet weak var loginButton: DesignableButton!
    let loginEndpoint = "https://matefix.herokuapp.com/oauth/token"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButton(sender: AnyObject) {
        var email = emailTextField.text
        var pass = passwordTextField.text
        
        let params = ["email" : email , "password" : pass]
        
        Alamofire.request(.POST, loginEndpoint, parameters: params, encoding: .JSON)
            .responseJSON{(request, response, data, error) in
                if let anError = error {
                    println("error")
                    println(error)
                }
                else if let data: AnyObject = data
                {
                    let post = JSON(data)
                    println(post.description)
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
