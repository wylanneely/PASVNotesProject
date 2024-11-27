//
//  CreateNoteViewController.swift
//  NotesProject
//
//  Created by Wylan L Neely on 11/25/24.
//

import UIKit

class CreateNoteViewController: UIViewController {

    //MARK: App lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: Outlets
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var createNoteButton: UIButton!
    
    //MARK: Action
    @IBAction func createNoteButtonTapped(_ sender: Any) {
        
    }
    
}
