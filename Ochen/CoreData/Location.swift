//
//  Location.swift
//  
//
//  Created by Алексей Агапов on 13/07/16.
//
//

import Foundation
import CoreData

class Location: NSManagedObject {
  convenience init() {
    // Description
    let entity = NSEntityDescription.entityForName("Location", inManagedObjectContext: CoreDataManager.instance.managedObjectContext)
    
    // New object creation
    self.init(entity: entity!, insertIntoManagedObjectContext: CoreDataManager.instance.managedObjectContext)
  }
}


struct GroupedLocation {
  // City name
  var groupName: String
  var locations: [Location]
}
