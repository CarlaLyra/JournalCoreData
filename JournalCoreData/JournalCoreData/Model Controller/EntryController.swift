//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Carla Lyra on 1/18/21.
//

import CoreData

class EntryController {
    
    //MARK: -Shared Instance
    static let shared = EntryController()
    
    //MARK: -SOT
    var entries: [Entry] = []
    
    //MARK: -Fetch Request
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    //MARK: -CRUD
    
    func createEntry(title: String, body: String) {
        Entry(title: title, body: body)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        self.entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    func updateEntry(entry: Entry, title: String, body: String) {
        entry.title = title
        entry.body = body
        entry.timestamp = Date()
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(entry: Entry) {
        entry.managedObjectContext?.delete(entry)
        CoreDataStack.saveContext()
        fetchEntries()
    }
}//end of class

