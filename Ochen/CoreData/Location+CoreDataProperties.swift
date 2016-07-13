//
//  Location+CoreDataProperties.swift
//  
//
//  Created by Алексей Агапов on 13/07/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Location {

    @NSManaged var city: String?
    @NSManaged var descr: String?
    @NSManaged var imageLink: String?
    @NSManaged var latitude: Double
    @NSManaged var longitude: Double
    @NSManaged var name: String

}
