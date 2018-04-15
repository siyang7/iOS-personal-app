//
//  AppDelegate.swift
//  NotePad
//
//  Created by Si-Yang Wu on 2018-04-14.
//  Copyright © 2018 Si-Yang Wu. All rights reserved.
//

import UIKit
import CoreData
import TraceLog

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        logInfo { "Entering \(#function)" }
        
        // some blue colour on title bar
        UINavigationBar.appearance().barTintColor = UIColor(red: 53.0/255.0, green: 115.0/255.0, blue: 214.0/255.0, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1.0)
        
        let color = UIColor(red: 249.0/255.0, green: 248.0/255.0, blue: 232.0/255.0, alpha: 1.0)
        let font = UIFont(name: "Arial-BoldMT", size: 18)!
        
        let attributes: [NSAttributedStringKey: AnyObject] = [
            NSAttributedStringKey.font: font,
            NSAttributedStringKey.foregroundColor: color
        ]
        
        UINavigationBar.appearance().titleTextAttributes = attributes
        UIApplication.shared.statusBarStyle = .lightContent
        
        logInfo { "Leaving \(#function)" }
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        logInfo { "Entering \(#function)" }
        logInfo { "Leaving \(#function)" }
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        logInfo { "Entering \(#function)" }
        logInfo { "Leaving \(#function)" }
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        logInfo { "Entering \(#function)" }
        logInfo { "Leaving \(#function)" }
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        logInfo { "Entering \(#function)" }
        logInfo { "Leaving \(#function)" }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        logInfo { "Entering \(#function)" }
        logInfo { "Leaving \(#function)" }
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        logInfo { "Entering \(#function)" }
        
        let container = NSPersistentContainer(name: "NotePad")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        logInfo { "Leaving \(#function)" }
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        logInfo { "Entering \(#function)" }
    
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
        
        logInfo { "Leaving \(#function)" }
    }
}

