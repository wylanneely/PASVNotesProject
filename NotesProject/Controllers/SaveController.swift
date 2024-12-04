//
//  SaveController.swift
//  NotesProject
//
//  Created by Wylan L Neely on 12/3/24.
//

import Foundation

class SaveController {
    
    static let shared = SaveController() // Singleton instance
    
    private init() {} // Prevent external instantiation
    
    private let notesKey: String = "notesKey"
    
    
    // Save notes to UserDefaults
    func saveNotes() {
        
        let notes: [Note] = NotesController.shared.getAllNotes()
        
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
    func loadNotes() {
        guard let data = UserDefaults.standard.data(forKey: notesKey) else {
            print("No notes to load.")
            return
        }
        
        let decoder = JSONDecoder()
        do {
            let loadedNotes = try decoder.decode([Note].self, from: data)
            NotesController.shared.replaceAllNotes(with: loadedNotes)
            print("Notes loaded successfully!")
        } catch {
            print("Failed to load notes: \(error)")
        }
    }
}
