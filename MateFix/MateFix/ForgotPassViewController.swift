//
//  ForgotPassViewController.swift
//  MateFix
//
//  Created by Carlos on 4/12/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import UIKit
import Alamofire

class ForgotPassViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    let forgotPassEndpoint = "https://matefix.herokuapp.com/users/forgotpass"
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        return UIStatusBarAnimation.Fade
    }

    @IBAction func sendButon(sender: AnyObject) {
       
        let emailParam = ["email": emailTextField.text]
        
        Alamofire.request(.POST , forgotPassEndpoint, parameters: emailParam, encoding: .JSON )
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
