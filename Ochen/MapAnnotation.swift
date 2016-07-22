//
//  MapAnnotation.swift
//  Ochen
//
//  Created by Алексей Агапов on 22/07/16.
//  Copyright © 2016 ru.testing.project. All rights reserved.
//

import Foundation

import MapKit

class Annotation: NSObject, MKAnnotation {
  let title: String?
  let locationName: String
  let coordinate: CLLocationCoordinate2D
  
  init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
    self.locationName = locationName
    self.coordinate = coordinate
    
    super.init()
  }
  
  var subtitle: String? {
    return locationName
  }
}