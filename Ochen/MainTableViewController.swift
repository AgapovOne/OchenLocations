//
//  MainTableViewController.swift
//  Ochen
//
//  Created by Алексей Агапов on 13/07/16.
//  Copyright © 2016 ru.testing.project. All rights reserved.
//

import UIKit
import Foundation

import SwiftyJSON

class MainTableViewController: UITableViewController {
  
  var dataSource: [Int] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
    
    fetchData {
      print($0)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

// MARK: - Data management
extension MainTableViewController {
  func fetchData(completionHandler: ([Int]?) -> ()) {
    let session = NSURLSession(configuration: .defaultSessionConfiguration())
    let request = NSURLRequest(URL: NSURL(string: "https://dl.dropboxusercontent.com/u/32448889/TetsTask/places_25_06.json")!, cachePolicy: .ReturnCacheDataElseLoad, timeoutInterval: 20.0)
    session.dataTaskWithRequest(request) { (data, response, error) in
      guard error == nil else {
        print(error)
        completionHandler(nil)
        return
      }
      
      guard let dataObject = data else {
        completionHandler(nil)
        return
      }
      
      let json = JSON(data: dataObject)
      
      var locations: [Location] = []
      
      
      completionHandler([json["places"].arrayValue.count])
      
    }.resume()
  }
}

// MARK: - Table view data source
extension MainTableViewController {
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 0
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 0
  }
  
  /*
   override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
   
   // Configure the cell...
   
   return cell
   }
   */
  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
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
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
}

// MARK: - Navigation
extension MainTableViewController {
  /*
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
