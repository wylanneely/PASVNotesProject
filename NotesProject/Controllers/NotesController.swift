//
//  NotesController.swift
//  NotesProject
//
//  Created by Wylan L Neely on 11/25/24.
//

import Foundation


class NotesController {
    
    let saveController = SaveController()
    
    private var notes: [Note] = [] {
        didSet {
            saveController.saveNotes(notes: self.notes)
        }
    }
    //crud functions
    
    
    init() {
        // Automatically load notes when NotesController is initialized
        self.notes = saveController.loadNotes()
    }
    
    // Helper: Replace notes
    func replaceAllNotes(with newNotes: [Note]) {
        self.notes = newNotes
    }
    
    //MARK: - Create
                  //outside variable, or what is displayed when called,
    func createNote(title insideVariable:String, message: String){
                            //what you use inside of the function
        let newNote = Note(title: insideVariable, message: message)
        notes.append(newNote)
    }
    
    //MARK: - Read
    
    func getAllNotes()->[Note] {
       return saveController.loadNotes()
    }
                    
    func getNoteByID(_ id:UUID)->Note?{
        for n in notes {
            if n.id == id {
                return n
            }
        }
        return nil
    }
    
    func getNoteByID2(_ id:UUID)->Note?{
        return notes.first { $0.id == id}
    }
    
    
    func returnSelectedNote(row: Int)-> Note {
        return notes[row]
    }
    
   
    //MARK: - Update
    
    func updateNote(id:UUID, newTitle: String?, newMessage:String?){
        
        let c = notes.count
        
        for i in 0..<c {
            if notes[i].id == id {
                if let newTitle = newTitle {
                    notes[i].title = newTitle
                }
                
                if let newMessage = newMessage {
                    notes[i].message = newMessage
                }
                break
            }
        }
        
        
    }
    
    
    func updateNote2(id: UUID, newTitle: String?, newMessage: String?) {
        
        if let index = notes.firstIndex(where: {$0.id == id }) {
            
            if let newTitle = newTitle {
                notes[index].title = newTitle
            }
         
            if let newMessage = newMessage {
                notes[index].message = newMessage
            }
        }
        
    }
    
    
    //MARK: - Delete
    
    
    func deleteNoteById(_ id: UUID){
        if let index = notes.firstIndex(where: { $0.id == id }) {
            notes.remove(at: index)
        }
    }
    
}
