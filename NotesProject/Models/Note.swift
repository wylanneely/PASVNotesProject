//
//  Note.swift
//  NotesProject
//
//  Created by Wylan L Neely on 11/25/24.
//

import Foundation

struct Note: Codable {
    
    var title: String
    var message: String
    
    var timestamp: Date
    var id: UUID 
    
    
    init(title: String, message: String) {
        self.title = title
        self.message = message
        
        self.timestamp = Date() //when you create a date object, it creates a date at time of creation date
        self.id = UUID() //creates a unique id
    }
    
}



