//
//  MainLocationViewController.swift
//  Ochen
//
//  Created by Алексей Агапов on 22/07/16.
//  Copyright © 2016 ru.testing.project. All rights reserved.
//

import UIKit
import MapKit

class MainLocationViewController: UIViewController {
  @IBOutlet weak var mapView: MKMapView!
  
  var location: Location? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let location = location else {
      return
    }
    
    let initialLocation = CLLocation(latitude: location.latitude,
                                     longitude: location.longtitude)
    let regionRadius: CLLocationDistance = 1000
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate,
                                                              regionRadius * 2.0, regionRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
    
    let annotation = Annotation(title: location.name,
                                locationName: location.city ?? location.name,
                                coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longtitude))

    mapView.addAnnotation(annotation)
  }
  
  func centerMapOnLocation(location: CLLocation) {
  }
}
