//
//  LoginViewController.swift
//  MateFix
//
//  Created by Christian Rivera on 3/20/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    @IBOutlet weak var loginButton: DesignableButton!
    let loginEndpoint = "https://matefix.herokuapp.com/oauth/token"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool){
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.barTintColor = UIColorFromRGB(0xF5A623)
        self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
    }
    
    @IBAction func loginButton(sender: AnyObject) {
        var email = emailTextField.text
        var pass = passwordTextField.text
        if isValidEmail(email) && pass.length >= 6 {
            let user = User(email: email, password: pass)
        
        Alamofire.request(.POST, loginEndpoint, parameters: user.toDictionary(), encoding: .JSON)
            .responseJSON{(request, response, data, error) in
                if let anError = error {
                    println("error")
                    println(error)
                }
                else if let data: AnyObject = data
                {
                    let token = JSON(data)
                    println(token["token"])
                }
        }
        } else {
            var alert = UIAlertController(title: "Incorrect Email", message: "The email or password you entered is not valid, try again.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)        }

    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
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
