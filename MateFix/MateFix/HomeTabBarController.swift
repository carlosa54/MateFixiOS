//
//  HomeTabBarController.swift
//  MateFix
//
//  Created by Carlos on 5/31/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.performSegueWithIdentifier("Initial", sender: self)

    }
}
