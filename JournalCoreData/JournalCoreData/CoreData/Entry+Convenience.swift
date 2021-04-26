//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Daniel Dickey on 4/26/21.
//

import CoreData

extension Entry {
    @discardableResult convenience init(title: String, body: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.body = body
        self.timestamp = timestamp
    }
}//End of Extension

