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
        
        let container = NSPersistentContainer(name: "MakeSchoolNotes")
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

