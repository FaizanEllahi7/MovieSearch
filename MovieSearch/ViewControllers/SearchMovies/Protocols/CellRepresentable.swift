//
//  CellRepresentable.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import UIKit

protocol CellRepresentable {
    
    func numberOfRowsInSection() -> Int
    func cellInstance(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    
}
