//
//  ViewController.swift
//  NotesProject
//
//  Created by Wylan L Neely on 11/25/24.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  

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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteViewCell", for: indexPath) as? NoteViewCell else {
                   return UITableViewCell()
               }
        
        
        return cell
    }
    
    
}

