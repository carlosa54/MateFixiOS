//
//  MainViewController.swift
//  MateFix
//
//  Created by Carlos on 3/23/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var allViews: [UIViewController] = []
    var pageViews: [UIViewController] = []
    
    
    @IBAction func didChangeValue(sender: UIPageControl) {
        
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
        self.navigationController?.navigationBarHidden = true
        
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
