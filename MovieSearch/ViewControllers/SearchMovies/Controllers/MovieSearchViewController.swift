//
//  MovieSearchViewController.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import UIKit

class MovieSearchViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var movieSearchBar: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    
    @IBOutlet weak var networkIndicator: UIActivityIndicatorView!
    //Secondary search results controller used in SearchResultsController.
    var resultsTableController: SearchResultsController!
    var searchController: UISearchController!
    
    //MARK:- ViewModel
    lazy var movieViewModel = MovieSearchViewModel()
    
    //MARK:- Application Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dynamic tableview cell height
        movieTableView.estimatedRowHeight = 175
        movieTableView.rowHeight = UITableViewAutomaticDimension
        
        // Setup the Search Controller
        resultsTableController = SearchResultsController()
        resultsTableController.delegate = self
        searchController = UISearchController(searchResultsController: resultsTableController)
        searchController.delegate = self
        searchController.searchBar.placeholder = searchBarPlaceholderText
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        if #available(iOS 11.0, *) {
            // For iOS 11 and later, we place the search bar in the navigation bar.
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationItem.searchController = searchController
            
            // We want the search bar visible all the time.
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            // For iOS 10 and earlier, we place the search bar in the table view's header.
            movieTableView.tableHeaderView = searchController.searchBar
        }
        //Listen for the updates from view model
        listernForUpdates()
    }
    
}
//MARK:- Helper Methods
extension MovieSearchViewController {
    
    func listernForUpdates() {
        
        movieViewModel.searchResult.bindAndFire({ [weak self] result in
            
            guard let strongSelf = self else { return }
            
            switch (result) {
            case .success:
                DispatchQueue.main.async {
                    if strongSelf.movieTableView.tableFooterView != nil {
                        strongSelf.movieTableView.tableFooterView = nil
                    }
                    strongSelf.movieTableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    strongSelf.showAlert(message: error)
                }
                
            case .noResult(let error):
                DispatchQueue.main.async {
                    strongSelf.showAlert(message: error)
                }
            }
        })
    }
    
    func showSearchResultController() {
        
        DispatchQueue.main.async {
            
            self.resultsTableController.searchHistory = self.movieViewModel.getSearchHistory()
            self.searchController.searchResultsController?.view.isHidden =  false
        }
    }
    
    func hideSearchResultController() {
        
        DispatchQueue.main.async {
            
            self.searchController.searchResultsController?.view.isHidden =  true
        }
    }
    
    func showNetworkIndicator() {
        
        DispatchQueue.main.async {
            
            self.networkIndicator.startAnimating()
            self.networkIndicator.isHidden = false
        }
    }
    
    func hideNetworkIndicator() {
        
        DispatchQueue.main.async {
            
            self.networkIndicator.stopAnimating()
            self.networkIndicator.isHidden = true
        }
    }
}

//MARK:- Alert
extension MovieSearchViewController {
    
    func showAlert(title: String = "Error", message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

//MARK:- SearchBar Delegate Methods
extension MovieSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        hideSearchResultController()
        let queryText = searchBar.text!
        movieViewModel.searchQuery(queryText: queryText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        //movieSearchBar.resignFirstResponder()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        
        if searchBar.text?.count == 0 {
            
            showSearchResultController()
        } else {
            
            hideSearchResultController()
        }
        
        return true
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count == 0 {
            
            showSearchResultController()
        } else {
            
            hideSearchResultController()
        }
    }
}

extension MovieSearchViewController: SearchResultsControllerDelegate {
    
    func selectedMovie(query: String, indexPath: IndexPath) {
        
        searchController.searchBar.text = query
        movieViewModel.searchQuery(queryText: query)
        hideSearchResultController()
    }
}

//MARK:- TableView Data Source Methods
extension MovieSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return movieViewModel.cellInstance(tableView: tableView, indexPath:indexPath)
    }
}

//MARK:- TableView Delegate Source Methods
extension MovieSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // At the bottom...
        if (indexPath.row == movieViewModel.numberOfRowsInSection() - 1) {
            if movieViewModel.queryResult.pagination.hasnextPage() {
                
                // Show a spinner as a network request indicator while loading the next page
                let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
                spinner.startAnimating()
                spinner.frame = CGRect(x: 0, y: 0, width: self.movieTableView.frame.width, height: 44)
                self.movieTableView.tableFooterView = spinner;
                
                movieViewModel.fecthNextPage()
            }
        }
    }
}

extension MovieSearchViewController: UISearchControllerDelegate {
    func presentSearchController(_ searchController: UISearchController) {
        
        showSearchResultController()
    }
}
