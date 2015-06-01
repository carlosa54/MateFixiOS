//
//  ProfileTableViewController.swift
//  MateFix
//
//  Created by Christian Rivera on 5/4/15.
//  Copyright (c) 2015 Carlos Ramirez. All rights reserved.
//

import UIKit
import Alamofire

class ProfileTableViewController: UITableViewController {
    
    var user: User?


    var userEndPoint = "https://matefix.herokuapp.com/users/133"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
       
            Alamofire.request(.GET, userEndPoint)
            .responseObject { (_, _, ruser: User?, _) -> Void in
                 dispatch_async(dispatch_get_main_queue()) { () -> Void in
                    if (ruser != nil) {
                    self.user = ruser!
                    println(self.user!.email)
                    self.tableView.reloadData()
                    }
                 }
        }
         
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    private struct Storyboard {
        static let CellReuseIdentifier = "Profile"
        static let aboutMeCell = "About"
        static let skillsCell = "Skills"
        static let reviewsCell = "Reviews"
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        
        if indexPath.section == 1{
            let aboutCell = tableView.dequeueReusableCellWithIdentifier(Storyboard.aboutMeCell, forIndexPath: indexPath) as! AboutTableViewCell
            aboutCell.user = user
            return aboutCell
        } else if indexPath.section == 2{
            let skillsCell = tableView.dequeueReusableCellWithIdentifier(Storyboard.skillsCell, forIndexPath: indexPath) as! SkillsTableViewCell
            skillsCell.user = user
            return skillsCell
        } else if indexPath.section == 3 {
            let reviewsCell = tableView.dequeueReusableCellWithIdentifier(Storyboard.reviewsCell, forIndexPath: indexPath) as! ReviewTableViewCell
            reviewsCell.user = user
            return reviewsCell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier, forIndexPath: indexPath) as! ProfileTableViewCell
            cell.user = user
            
            return cell
        }
        

        // Configure the cell...
        
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
