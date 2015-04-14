//
//  SignUpViewController.swift
//  MateFix
//
//  Created by Carlos on 3/24/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import UIKit
import Alamofire


class SignUpViewController: UIViewController {

    @IBOutlet weak var nameTextField: DesignableTextField!
    @IBOutlet weak var lastNameTextField: DesignableTextField!
    @IBOutlet weak var passwordTextField: DesignableTextField!
    @IBOutlet weak var emailTextField: DesignableTextField!
    @IBOutlet weak var signUpButton: DesignableButton!
    
    var registerEndPoint = "https://matefix.herokuapp.com/users/register"
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
//        PKNotification.loading(true)  // show loading view.
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
//                      PKNotification.loading(false) // hide loading view.
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
    

    @IBAction func signUpButton(sender: DesignableButton) {
        
        self.view.userInteractionEnabled = false
        PKNotification.loading(true)  // show loading view.
        var email = emailTextField.text
        var password = passwordTextField.text
        var firstName = nameTextField.text
        var lastName = lastNameTextField.text
        
        
        var params = ["email":email, "password":password, "first_name":firstName, "last_name": lastName, "about_me": "", "street_1": "Testing 101", "country": "PR", "city": "test", "zip_code": "00667"] as Dictionary<String,String>
        
            signUpButton.enabled = false
        
        
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
            }
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
//            post(params, url: "https://matefix.herokuapp.com/users/register") { (succeeded: Bool, msg: String) -> () in
//            var alert = UIAlertView(title: "Success!", message: msg, delegate: nil, cancelButtonTitle: "Okay.")
//            if(succeeded) {
//                alert.title = "Success!"
//                alert.message = msg
//            }
//            else {
//                alert.title = "Failed : ("
//                alert.message = msg
//            }
//        
//            // Move to the UI thread
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                // Show the alert
//                alert.show()
//            })
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
