//
//  MainViewModel.swift
//  Ochen
//
//  Created by Алексей Агапов on 14/07/16.
//  Copyright © 2016 ru.testing.project. All rights reserved.
//

import Foundation
import SwiftyJSON

class MainViewModel {
  static let instance = MainViewModel()
  
  func getNetworkData(completionHandler: [GroupedLocation]? -> ()) {
    fetchData { (locations) in
      guard let locations = locations else {
        completionHandler(nil)
        return
      }
      
      let groupedLocation = GroupedLocation(groupName: "All", locations: locations)
      
      completionHandler([groupedLocation])
    }
  }
  
  func fetchData(completionHandler: ([Location]?) -> ()) {
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
      
      for obj in json["places"].arrayValue {
        let location = Location()
        location.city = obj["city"].string
        location.name = obj["name"].stringValue
        location.descr = obj["description"].stringValue
        location.imageLink = obj["image"].string
        location.longitude = obj["longitude"].doubleValue
        location.latitude = obj["latitude"].doubleValue
        
        locations.append(location)
      }
      
      CoreDataManager.instance.saveContext()
      
      completionHandler(locations)
      
      }.resume()
  }
}