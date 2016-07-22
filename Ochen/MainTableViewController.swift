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
import MapKit

class MainTableViewController: UITableViewController {
  
  lazy var dataSource = MainDataSource()
  
  var filterRadius:Int = 1000
  
  override func viewDidLoad() {
    super.viewDidLoad()
    do {
      try dataSource.fetchedResultsController.performFetch()
    } catch {
      print(error)
    }
    tableView.dataSource = dataSource
    tableView.delegate = self
    
    self.refreshControl?.addTarget(self, action: #selector(fetchDataSource), forControlEvents: .ValueChanged)
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 88.0
  }
}

// MARK: - Data handling
extension MainTableViewController {
  @IBAction func fetchNetwork(sender: AnyObject) {
    MainViewModel.instance.getNetworkData {
      print($0?[0])
    }
  }
  
  func fetchDataSource() {
    do {
      let radius = self.filterRadius
      
      try dataSource.fetchedResultsController.performFetch()
    } catch {
      print(error)
    }
    tableView.dataSource = dataSource
    
    tableView.reloadData()
    self.refreshControl?.endRefreshing()  }
}

// MARK: - Navigation
extension MainTableViewController {
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let object = dataSource.fetchedResultsController.objectAtIndexPath(indexPath)

    print(object)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    let cell = cell as? LocationTableViewCell
    cell?.locationImage.nk_cancelLoading()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "toLocation" {
      let locationViewController: MainLocationViewController = segue.destinationViewController as! MainLocationViewController
      
      guard let cellIndex = tableView.indexPathForSelectedRow else {return}
      let object = dataSource.fetchedResultsController.objectAtIndexPath(cellIndex) as? Location
      locationViewController.location = object
    }
  }
}
