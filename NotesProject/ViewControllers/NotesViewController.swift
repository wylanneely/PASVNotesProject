//
//  ViewController.swift
//  NotesProject
//
//  Created by Wylan L Neely on 11/25/24.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var notes: [Note] {
        return NotesController.shared.getAllNotes()
        
        //test data
//        let note1 = Note(title: "Hello 1", message: "Hello world message 1")
//        let note2 = Note(title: "Hello 2", message: "Hello world message 2")
//        let note3 = Note(title: "Hello 3", message: "Hello world message 3")
//        let note4 = Note(title: "Hello 4", message: "Hello world message 4")
//        
//        return [note1,note2,note3,note4]

    }
  
    //MARK: - App Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteViewCell", for: indexPath) as? NoteViewCell else {
                   return UITableViewCell()
               }
        
        let note = notes[indexPath.row]
        cell.setupNote(note: note)
        
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

    
}

