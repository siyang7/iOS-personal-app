//
//  ListNotesTableViewController.swift
//  NotePad
//
//  Created by Si-Yang Wu on 2018-04-14.
//  Copyright © 2018 Si-Yang Wu. All rights reserved.
//

import UIKit
import TraceLog
import CoreData

class ListNotesTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var notes = [Note]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        logInfo { "Entering \(#function)" }
        
        notes = CoreDataHelper.retrieveNotes()
    
        logInfo { "Leaving \(#function)" }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInfo { "Entering \(#function)" }
    
        // retrieve previously existing notes
        notes = CoreDataHelper.retrieveNotes()
        
        logInfo { "Leaving \(#function)" }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        logInfo { "Entering \(#function)" }
        logInfo { "Leaving \(#function)" }
        // return the number of notes in the array notes
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        logInfo { "Entering \(#function)" }
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "listNotesTableViewCell", for: indexPath) as! ListNotesTableViewCell
        
        let note = notes[indexPath.row] // return # of notes in notes array
        cell.noteTitleLabel.text = note.title
        cell.noteModificationTimeLabel.text = note.modificationTime?.convertToString() ?? "unknown"
      
        logInfo { "Leaving \(#function)" }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        logInfo { "Entering \(#function)" }
        
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
            case "displayNote":
                // get a reference to the index path of the selected row in the tabie view
                guard let indexPath = tableView.indexPathForSelectedRow else { return }
                
                // retrieve the selected note using the index path from the prev step
                let note = notes[indexPath.row]
                
                // get a reference & type cast our segue's destination view controller
                let destination = segue.destination as! DisplayNoteViewController
                
                // set note property to the selected note
                destination.note = note
                
                print("note cell tapped")
            
            case "addNote":
                print("create note bar button item tapped")
            
            default:
                print("unexpected segue identifier")
        }
        
        logInfo { "Leaving \(#function)" }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        logInfo { "Entering \(#function)" }
      
        if editingStyle == .delete {
            let noteToDelete = notes[indexPath.row]
            CoreDataHelper.delete(note: noteToDelete)
            
            notes = CoreDataHelper.retrieveNotes()
        }
        
        logInfo { "Leaving \(#function)" }
    }
}
