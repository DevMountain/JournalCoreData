//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Daniel Dickey on 4/26/21.
//

import CoreData

class EntryController {
    
    
    // MARK: - Properties
    static let shared = EntryController()
    
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    // MARK: - Functions
    
    func createEntry(title: String, body: String) {
        let newEntry = Entry(title: title, body: body)
        entries.append(newEntry)
        
        CoreDataStack.saveContext()
    }
    
    func updateEntry(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.body = body
        
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(entry: Entry){
        guard let entryToDelete = entries.firstIndex(of: entry) else {return}
        entries.remove(at: entryToDelete)
        CoreDataStack.context.delete(entry)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        self.entries = entries
    }
    
    
}//End of Class
