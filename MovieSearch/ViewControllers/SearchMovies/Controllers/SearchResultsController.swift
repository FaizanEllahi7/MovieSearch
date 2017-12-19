//
//  SearchResultsController.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/15/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import UIKit

protocol SearchResultsControllerDelegate {
    
    func selectedMovie(query: String, indexPath: IndexPath)
}

class SearchResultsController : UITableViewController {
    
    var searchHistory = [String]() {
        didSet{
            self.tableView.reloadData()
        }
    }
    
    var delegate: SearchResultsControllerDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: resultsTableViewCellIdentifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tableView.isHidden = false
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchHistory.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: resultsTableViewCellIdentifier, for: indexPath)
        cell.textLabel!.text = searchHistory[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        delegate?.selectedMovie(query: searchHistory[indexPath.row], indexPath: indexPath)
    }
}
