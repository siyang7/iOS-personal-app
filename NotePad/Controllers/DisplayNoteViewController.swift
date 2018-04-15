//
//  DisplayNoteViewController.swift
//  NotePad
//
//  Created by Si-Yang Wu on 2018-04-14.
//  Copyright © 2018 Si-Yang Wu. All rights reserved.
//

import UIKit
import TraceLog
import CoreData

class DisplayNoteViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    // MARK: - Properties
    
    var note: Note?
    
//    // Now, with 3 short lines of code is where the magic happens
//    // First the objects are wrapped up in a generic array
//    var customObjects = [Note]()
//    // Next, the .sorted(by:) method returns a collection that compares an element in the array against the next element and arranges the collection by date.
//    // The sorted collection is assigned back to the customObjects array for display
//    customObjects = customObjects.sorted(by: {
//        $0.date.compare($1.date) == .orderedDescending
//    })
//    // The sorted customObjects collection is then printed out to display the objects sorted descending by date
//    for obj in customObjects {
//        print("Sorted Date: \(obj.date) with title: \(obj.title)")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInfo { "Entering \(#function)" }
        logInfo { "Leaving \(#function)" }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logInfo { "Entering \(#function)" }
        
        titleTextField.placeholder = "Create a title..."
//        contentTextView.text = "placeholder"
//        contentTextView.textColor = UIColor.lightGray
        
        // check note for an existing note
        if let note = note {
            // populates the text field & text view w/ the content of existing note
            titleTextField.text = note.title
            contentTextView.text = note.content
        } else {
            // clear story boards filler text so user can add notes
            titleTextField.text = ""
            contentTextView.text = ""
        }
        
        logInfo { "Leaving \(#function)" }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        logInfo { "Entering \(#function)" }
 
        // check that destination view controller of our segue is of type ListNotesTableViewController
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
            // save an existing note
            case "save" where note != nil:
                note?.title = titleTextField.text ?? ""
                note?.content = contentTextView.text ?? ""
                note?.modificationTime = Date()
                
                CoreDataHelper.saveNote()
            
            // creating new note
            case "save" where note == nil:
                // create new notes
                let note = CoreDataHelper.newNote()
                
                // title and content
                note.title = titleTextField.text ?? ""
                note.content = contentTextView.text ?? ""
                
                // time note was created
                note.modificationTime = Date()
                
                CoreDataHelper.saveNote()
            
            case "cancel":
                print("cancel bar button item tapped")
            
            default:
                print("unexpected segue identifier")
        }
        
        logInfo { "Leaving \(#function)" }
    }
}
