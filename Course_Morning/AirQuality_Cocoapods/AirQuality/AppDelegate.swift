//
//  AppDelegate.swift
//  AirQuality
//
//  Created by Trevor Wu on 2019/4/17.
//  Copyright © 2019年 TxWStudio. All rights reserved.
//

import UIKit
import CoreData
import Alamofire
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UIPopoverPresentationControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /// Set default value of UserDefault.
        UserDefaults.standard.register(defaults: ["mySelect": 0])
        
        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
        
        
        return true
    }
    
    
    var arrayPlace = ["測站"]
    var arrayAQI = ["取得中..."]
    var arrayStatus = ["品質狀態"]
    
    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

        if let vc = window?.rootViewController as? ViewController {

//            vc.updateUI(siteNameAD: "123", aqiDataAD: "123", statusAD: "123")
    
            let id = UserDefaults.standard.integer(forKey: "mySelect")
            let url = "https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json"
            Alamofire.request(url).responseJSON { (response) in
                if response.result.isSuccess {

                    let json: JSON = JSON(response.result.value!)

                    self.arrayPlace.removeAll()
                    self.arrayAQI.removeAll()
                    self.arrayStatus.removeAll()

                    /// According to SwiftyJSON documentation, use following for loop when json is .Array
                    // _ was "index"
                    for (_, subJson):(String, JSON) in json {

                        let SiteName = subJson["SiteName"].string
                        let County = subJson["County"].string
                        let Place = "\(County!) \(SiteName!)"
                        self.arrayPlace.append(Place)

                        let AQI = subJson["AQI"].string
                        self.arrayAQI.append(AQI!)

                        let Status = subJson["Status"].string
                        self.arrayStatus.append(Status!)
                    }
                    vc.updateUI(siteNameAD: self.arrayPlace[id], aqiDataAD: self.arrayAQI[id], statusAD: self.arrayStatus[id])
                    completionHandler(.newData)
                    
                    
                } else if response.result.isFailure {
                    completionHandler(.failed)
                } // .if statement - response
            } // .Alamofire responseJSON
            
        }
    }
    
    
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "AirQuality")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

