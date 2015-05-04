//
//  SignUpViewController.swift
//  MateFix
//
//  Created by Carlos on 3/24/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import UIKit
import Alamofire


class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: DesignableTextField!
    @IBOutlet weak var lastNameTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var signUpButton: DesignableButton!
    
    var registerEndPoint = "https://matefix.herokuapp.com/users/register"
        
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
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
    
//    func post(params: NSDictionary, url: String, postCompleted : (succeeded: Bool, msg: String) -> ()){
//        
//
//        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
//        var session = NSURLSession.sharedSession()
//        request.HTTPMethod = "POST"
//        
//        
//        
//        var err: NSError?
//        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        
//        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
//            println("Response: \(response)")
//            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
//            println("Body: \(strData)")
//            var err: NSError?
//            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary
//            
//            var msg = "No Message"
//            
//            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
//            if(err != nil) {
//                println(err!.localizedDescription)
//                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
//                postCompleted(succeeded: false, msg: "Error!")
//                println("Error could not parse JSON: '\(jsonStr)'")
//            }
//            else {
//                // The JSONObjectWithData constructor didn't return an error. But, we should still
//                // check and make sure that json has a value using optional binding.
//                if let parseJSON = json {
//                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
//                      postCompleted(succeeded: true, msg: "Logged in")
//                }
//                else {
//                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
//                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
//                    println("Error could not parse JSON: \(jsonStr)")
//                }
//            }
//        })
//        
//        task.resume()
//    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }


    @IBAction func signUpButton(sender: DesignableButton) {
        
        self.view.userInteractionEnabled = false
        var email = emailTextField.text
        var password = passwordTextField.text
        
        var user = User(email: email, password: password)
        
//        var params = ["email":email, "password":password, "first_name":firstName, "last_name": lastName, "about_me": "", "street_1": "Testing 101", "country": "PR", "city": "test", "zip_code": "00667"] as Dictionary<String,String>
        
            signUpButton.enabled = false
        
//            MatefixApi.signUpUser(email, password)
        
        Alamofire.request(.POST , registerEndPoint, parameters: user.toDictionary())
            .responseObject { (request, response, user: User?, error) in
            if let anError = error
            {
                // got an error in getting the data, need to handle it
                println("error calling POST")
                println(error)
            }
            else if let user: User = user
            {
                // to make sure it posted, print the results
                println(user.email)
                self.view.userInteractionEnabled = true
                }
        }
        
    
// TESTING USER COLLECTIONS
//        Alamofire.request(.GET, registerEndPoint)
//            .responseCollection { (_ , _ , nestedUser: [User]? , _) -> Void in
//                for users in nestedUser! {
//                    println(users.email)
//                }
//        }
        
        

        
        
        
        
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
