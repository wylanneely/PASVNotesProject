//
//  NoteViewCell.swift
//  NotesProject
//
//  Created by Wylan L Neely on 11/26/24.
//

import UIKit

class NoteViewCell: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupNote(note: Note){
        self.titleLabel.text = note.title
        self.messageTextView.text = note.message
    }
    
    //MARK: Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var messageTextView: UITextView!
    
    
}
