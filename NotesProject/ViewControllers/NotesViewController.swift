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
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewCell = tableView.dequeueReusableCell(withIdentifier: "notesViewCell", for: indexPath)
        viewCell.backgroundColor = .blue
        
        return UITableViewCell()
    }
    
    
}

