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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInfo { "Entering \(#function)" }
        logInfo { "Leaving \(#function)" }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logInfo { "Entering \(#function)" }
        
        titleTextField.placeholder = "Add a title"
        
        //contentTextView.backgroundColor = UIColor.yellow
        contentTextView!.layer.borderWidth = 3
        contentTextView!.layer.borderColor = UIColor.black.cgColor
        
        var lines:UnderlinedTextView!
        lines.draw(CGRect(x: CGFloat(20), y: CGFloat(20), width: CGFloat(400), height: CGFloat(400)))
        
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

class UnderlinedTextView: UITextView {
    var lineHeight: CGFloat = 13.8
    
    override var font: UIFont? {
        didSet {
            if let newFont = font {
                lineHeight = newFont.lineHeight
            }
        }
    }
    
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        
        let numberOfLines = Int(rect.height / lineHeight)
        let topInset = textContainerInset.top
        
        for i in 1...numberOfLines {
            let y = topInset + CGFloat(i) * lineHeight
            
            let line = CGMutablePath()
            line.move(to: CGPoint(x: 0.0, y: y))
            line.addLine(to: CGPoint(x: rect.width, y: y))
            ctx?.addPath(line)
        }
        
        ctx?.strokePath()
        
        super.draw(rect)
    }
}

