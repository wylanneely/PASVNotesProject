//
//  CreateNoteViewController.swift
//  NotesProject
//
//  Created by Wylan L Neely on 11/25/24.
//

import UIKit

class NoteViewController: UIViewController {
    
    let notesController = NotesController()

    var delegate: RefreshTableViewDelegate?
    
    //MARK: Edit Note Setup
    
    var note: Note?
    var isEditingNote: Bool = false
    
    func setupEditFormat(note: Note){
        self.note = note
        isEditingNote = true
    }
    
    //MARK: App lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        if isEditingNote {
            createOrUpdateNoteButton.setTitle("update", for: .normal)
            titleTextField.text = note?.title
            messageTextView.text = note?.message
        }

    }
    
    //MARK: Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var createOrUpdateNoteButton: UIButton!
    
    //MARK: Action
    @IBAction func createNoteButtonTapped(_ sender: Any) {
        if let title = titleTextField.text,
           let message = messageTextView.text {
            
            notesController.createNote(title: title, message: message)
            self.delegate?.refeshNotesTableView()
            self.dismiss(animated: true)            
        }
        
    }
    
   
}

protocol RefreshTableViewDelegate {
    func refeshNotesTableView()
}
