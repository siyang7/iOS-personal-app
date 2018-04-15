//
//  CoreDataHelper.swift
//  NotePad
//
//  Created by Si-Yang Wu on 2018-04-14.
//  Copyright © 2018 Si-Yang Wu. All rights reserved.
//

import UIKit
import CoreData
import TraceLog

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newNote() -> Note {
        logInfo { "Entering \(#function)" }
            
        let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context) as! Note
        
        logInfo { "Leaving \(#function)" }
        return note
    }
    
    static func saveNote() {
        logInfo { "Entering \(#function)" }
        
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
        
        logInfo { "Leaving \(#function)" }
    }
    
    static func delete(note: Note) {
        logInfo { "Entering \(#function)" }
        
        context.delete(note)
        
        saveNote()
        
        logInfo { "Leaving \(#function)" }
    }
    
    static func retrieveNotes() -> [Note] {
        logInfo { "Entering \(#function)" }
        
        do {
            let fetchRequest = NSFetchRequest<Note>(entityName: "Note")
            let results = try context.fetch(fetchRequest)
            
            logInfo { "Leaving \(#function)" }
            return results
            
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            logInfo { "Leaving \(#function)" }
            return []
        }
    }
}
