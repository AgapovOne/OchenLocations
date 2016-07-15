//
//  MainTableViewController.swift
//  Ochen
//
//  Created by Алексей Агапов on 13/07/16.
//  Copyright © 2016 ru.testing.project. All rights reserved.
//

import UIKit
import Foundation
import CoreData

import Nuke

class MainTableViewController: UITableViewController {
  
  var dataSource: [GroupedLocation] = [] {
    didSet {
      self.tableView.reloadData()
    }
  }
  
  /*var fetchedResultsController:NSFetchedResultsController = {
    let fetchRequest = NSFetchRequest(entityName: "Location")
    let sortDescriptor = NSSortDescriptor
  }*/
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
}

// MARK: - Data handling
extension MainTableViewController {
  @IBAction func refreshData(sender: AnyObject) {
    fetchDataSource()
  }
  
  func fetchDataSource() {
    
  }
}

// MARK: - Table view data source
extension MainTableViewController {
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return dataSource.count
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource[section].locations.count
  }
  
  override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return dataSource[section].groupName
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("locationCell", forIndexPath: indexPath) as! LocationTableViewCell
    
    let name = dataSource[indexPath.section].locations[indexPath.row].name
    cell.nameLabel.text = name
    
    if let imageLink = dataSource[indexPath.section].locations[indexPath.row].imageLink {
      let url = NSURL(string: imageLink) ?? NSURL(string: "http://lorempixel.com/400/200")!
      var request = ImageRequest(URL: url)
      request.targetSize = cell.locationImage.frame.size // Resize image
      
      Nuke.taskWith(request) { response in
        cell.locationImage.image = response.image
        }.resume()
      
    } else {
      let url = NSURL(string: "http://lorempixel.com/400/200")!
      var request = ImageRequest(URL: url)
      request.targetSize = cell.locationImage.frame.size // Resize image
      
      Nuke.taskWith(request) { response in
        cell.locationImage.image = response.image
        }.resume()
    }
  
    return cell
  }
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
