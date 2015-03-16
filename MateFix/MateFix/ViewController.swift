//
//  ViewController.swift
//  MateFix
//
//  Created by Carlos on 3/16/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var swipeLbl: UILabel!
    @IBOutlet weak var welcomeLbl: UILabel!
    @IBOutlet weak var singInBtn: UIButton!
    @IBOutlet weak var iphoneStart: UIImageView!
    
    @IBAction func singupGesture(sender: UIPanGestureRecognizer) {
        iphoneStart.frame = CGRect(x: iphoneStart.frame.origin.x, y: iphoneStart.frame.origin.y / 1.050, width: iphoneStart.frame.size.width, height: iphoneStart.frame.size.height)
        singInBtn.hidden = true
        swipeLbl.hidden = true
        welcomeLbl.hidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated .
    }


}

