//
//  AppDelegate.swift
//  Ochen
//
//  Created by Алексей Агапов on 13/07/16.
//  Copyright © 2016 ru.testing.project. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    return true
  }

  func applicationWillTerminate(application: UIApplication) {
    CoreDataManager.instance.saveContext()
  }
}
