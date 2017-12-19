//
//  CoreDataRepresentable.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/15/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation
import CoreData

class CoreDataRepresentable: PersistentRepresentable {
    
    /**
     Save the movie name in the core data.
     */
    func save(name: String) {
        
        let managedContext = CoreDataStorage.shared.context
        let entity = NSEntityDescription.entity(forEntityName: "SearchHistory", in: managedContext)!
        let movieHistory = NSManagedObject(entity: entity, insertInto: managedContext)
        movieHistory.setValue(name, forKeyPath: "movie")
        movieHistory.setValue(Date(), forKeyPath: "time")
        managedContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        
        do {
            
            try managedContext.save()
        } catch let error as NSError {
            
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    /**
     Get the list of last 10 successful quries from core data.
     */
    func searchHistory() -> [String] {
        
        let managedContext = CoreDataStorage.shared.context
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "SearchHistory")
        fetchRequest.fetchLimit = 10
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "time", ascending: false)]
        
        do {
            
            let queryList: [String] = try managedContext.fetch(fetchRequest).map({ moviesList in
                moviesList.value(forKey: "movie")
            }) as! [String]
            return queryList
        } catch let error as NSError {
            
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
}

