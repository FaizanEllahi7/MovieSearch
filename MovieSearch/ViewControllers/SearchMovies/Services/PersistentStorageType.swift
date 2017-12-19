//
//  PersistentStorageType.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/19/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import Foundation

enum PersistentStorageType {
    
    case coreData
    
    func getDataBaseType() -> PersistentRepresentable{
        
        switch self {
        case .coreData:
            return CoreDataRepresentable()
        }
    }
}
