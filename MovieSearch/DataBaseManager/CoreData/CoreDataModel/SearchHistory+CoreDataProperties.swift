//
//  SearchHistory+CoreDataProperties.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 19/12/2017.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//
//

import Foundation
import CoreData


extension SearchHistory {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<SearchHistory> {
        return NSFetchRequest<SearchHistory>(entityName: "SearchHistory")
    }
    
    @NSManaged public var movie: String?
    @NSManaged public var time: NSDate?
    
}
