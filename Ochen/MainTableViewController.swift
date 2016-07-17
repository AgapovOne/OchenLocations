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

class MainTableViewController: UITableViewController {
  
  lazy var dataSource = MainDataSource()
  
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
      try dataSource.fetchedResultsController.performFetch()
    } catch {
      print(error)
    }
    tableView.dataSource = dataSource
    
    tableView.reloadData()
    self.refreshControl?.endRefreshing()  }
}
