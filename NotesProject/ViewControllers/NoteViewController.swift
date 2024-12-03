//
//  CreateNoteViewController.swift
//  NotesProject
//
//  Created by Wylan L Neely on 11/25/24.
//

import UIKit

class NoteViewController: UIViewController {

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
            
            
            
            NotesController.shared.createNote(title: title, message: message)
            
            self.dismiss(animated: true)
            delegate?.refeshNotesTableView()
        }
        
    }
    
   
}

protocol RefreshTableViewDelegate {
    func refeshNotesTableView()
}
