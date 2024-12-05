//
//  SaveController.swift
//  NotesProject
//
//  Created by Wylan L Neely on 12/3/24.
//

import Foundation

class SaveController {
    
        
    private let notesKey: String = "notesKey"
    
    
    
    // Save notes to UserDefaults
    func saveNotes(notes:[Note]) {
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(notes)
            
            UserDefaults.standard.set(data, forKey: notesKey)
            print("Notes saved successfully!")
        } catch {
            print("Failed to save notes: \(error)")
        }
    }

    // Load notes from UserDefaults
    func loadNotes()-> [Note] {
        guard let data = UserDefaults.standard.data(forKey: notesKey) else {
            print("No notes to load.")
            return []
        }
        
        let decoder = JSONDecoder()
        do {
            let loadedNotes = try decoder.decode([Note].self, from: data)
            return loadedNotes
            print("Notes loaded successfully!")
        } catch {
            print("Failed to load notes: \(error)")
        }
        return []
    }
}
