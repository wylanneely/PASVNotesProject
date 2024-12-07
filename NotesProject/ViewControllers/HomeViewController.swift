//
//  ViewController.swift
//  NotesProject
//
//  Created by Wylan L Neely on 11/25/24.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, RefreshTableViewDelegate  {
    
    let notesController = NotesController()
    
    var notes: [Note]?

    //MARK: - Custom Delegate
    
    func refeshNotesTableView() {
        self.notes = notesController.getAllNotes()
        self.tableView.reloadData()
        self.tableView.reloadInputViews()
    }
    
    //MARK: - App Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.notes = notesController.getAllNotes()
        setupTableView() //call setup function
    }


    //MARK: TableView
    
    func setupTableView(){   // Set up the delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        //register nib
        let nib = UINib(nibName: "NoteViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "NoteViewCell")
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let notesCount = notes?.count {
            return notesCount
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteViewCell", for: indexPath) as? NoteViewCell else {
                   return UITableViewCell()
        }
        
        if let note = notes?[indexPath.row] {
            cell.setupNote(note: note)
            return cell
        }
            return UITableViewCell()
        
    }
    
    var selectedNote: Note?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let notes = notes {
            self.selectedNote = notes[indexPath.row]
            self.performSegue(withIdentifier:"toEditNoteVC" , sender: self)
        }
        
    }
    
    
    // MARK: - Navigation

    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationVC = segue.destination as? NoteViewController {
            destinationVC.delegate = self
            if segue.identifier == "toEditNoteVC",
               let note = self.selectedNote {
                destinationVC.setupEditFormat(note: note)
            }
        }
    }
    

    
}

