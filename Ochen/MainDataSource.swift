//
//  MainDataSource.swift
//  Ochen
//
//  Created by Алексей Агапов on 17/07/16.
//  Copyright © 2016 ru.testing.project. All rights reserved.
//

import UIKit
import CoreData

import Async
import Nuke

// MARK: - Table view data source
class MainDataSource: NSObject, UITableViewDataSource {
  
  var fetchedResultsController = CoreDataManager.instance.fetchedResultsController("Location", keyForSort: "city", sectionName: "city")
  
  // MARK: - Table View Data Source
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return fetchedResultsController.sections?.count ?? 0
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let sections = fetchedResultsController.sections {
      return sections[section].numberOfObjects
    } else {
      return 0
    }
  }
  
  func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return fetchedResultsController.sections?[section].name ?? "Все"
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("locationCell", forIndexPath: indexPath) as! LocationTableViewCell
    
    let location = fetchedResultsController.objectAtIndexPath(indexPath) as! Location
    
    let name = location.name
    cell.nameLabel.text = name
    
    cell.locationImage.image = nil
    
//    Async.background {
      if let imageLink = location.imageLink,
         let url = NSURL(string: imageLink) {
        cell.locationImage.nk_setImageWith(url)
      }
//    }
    return cell
  }
}