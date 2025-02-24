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
        
        if isEditingNote {
            createOrUpdateNoteButton.setTitle("update", for: .normal)
            titleTextField.text = note?.title
            messageTextView.text = note?.message
            deleteNoteButton.isHidden = false
        }

    }
    
    //MARK: Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var createOrUpdateNoteButton: UIButton!
    @IBOutlet weak var deleteNoteButton: UIButton!
    //deleteOutlet
    
    //MARK: Action
    @IBAction func createOrUpdateNoteButtonTapped(_ sender: Any) {
        if isEditingNote {
            if let title = titleTextField.text,
               let message = messageTextView.text,
               let note = note {
                notesController.updateNote(id: note.id, newTitle: title, newMessage: message)
                self.delegate?.refeshNotesTableView()
                self.dismiss(animated: true)
            }
        } else {
            if let title = titleTextField.text,
               let message = messageTextView.text {
                
                notesController.createNote(title: title, message: message)
                self.delegate?.refeshNotesTableView()
                self.dismiss(animated: true)
            }
            
        }
    }
        
    
    @IBAction func deleteNoteButtonTapped(_ sender: Any) {
        if let note = self.note {
            notesController.deleteNoteById(note.id)
            self.delegate?.refeshNotesTableView()
            self.dismiss(animated: true)
        }
        
    }
    
        //Make a delete button that appears only when entering through edit segue
   
}

protocol RefreshTableViewDelegate {
    func refeshNotesTableView()
}
