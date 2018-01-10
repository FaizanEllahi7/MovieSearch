//
//  MovieSearchViewModel.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import UIKit

class MovieSearchViewModel: NSObject, QueryResult {
    
    //MARK:- Variables
    var searchResult: Dynamic<MovieSearchResult>
    var queryResult: MoviesDataRepresentation!
    
    /**
     Storage is a container and any class that implement the PersistentRepresentable protocol can assign to it.
     */
    var storage:  PersistentRepresentable
    var searchRequestManager: MovieSearchRequest
    
    //MARK:- Initialization
    override init() {
        
        searchResult = Dynamic(.success)
        searchRequestManager = MovieSearchRequest()
        //Assign the core Data as a persistent storage.
        storage = PersistentStorageType.coreData.getDataBaseType()
    }
}

//MARK:- Network Requests
extension MovieSearchViewModel {
    
    /**
     Increase the page count and request for the next page of the search result.
     */
    func fecthNextPage() {
        
        let nextPage = queryResult.pagination.page! + 1
        searchQuery(queryText: queryResult.queryText, page: nextPage, isFetchingNextPage: true)
    }
    
    /**
     Request the network manager for a particular movie and send back the resposne from the server.
     
     - parameter queryText: Name of the movie
     - parameter page: Current page in the search result. Optional parameter and its default value is 1
     - parameter isFetchingNextPage: Bool to indicate that loading the next page from the server or querying for the result.Optional parameter and its default value is false
     */
    func searchQuery(queryText: String, page: Int = 1, isFetchingNextPage: Bool = false) {
        
        let trimmedString = queryText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmedString.count == 0 {
            
            searchResult.value = .failure(error: validTextError)
            return
        }
        
        let params = SearchMovieParamerters(query: queryText, api_key: api_key, page: page)
        
        searchRequestManager.searchMoviesWith(with: .searchMovie(params)) {[weak self] (result) in
            
            guard let strongSelf = self else { return }
            
            switch result {
                
            case .success(let movieData):
                if isFetchingNextPage {
                    
                    strongSelf.updateSearchResult(with: movieData as? Movies)
                } else {
                    
                    strongSelf.createSearchResult(from: movieData as? Movies, queryString: queryText)
                }
            case .failure(let error):
                strongSelf.searchResult.value = .failure(error:error.localizedDescription)
                
            }
        }
    }
    
    /**
     Mock request to check the server response in unit testing.
     */
    func getMockQueryResult(completion: @escaping (_ result: Result?) -> Void) {
        
        let params = SearchMovieParamerters(query: "Batman", api_key: api_key, page: 1)
        
        searchRequestManager.searchMoviesWith(with: .searchMovie(params)) {(result) in
            
            return completion(result)
            
        }
        
    }
    
    //MARK:- Update Query Result
    
    /**
     Create the pagination and movies data from the response fetch from the server
     
     - parameter movieData: Movies data  used to create the pagination and movies list
     - parameter queryString: Text of the current query
     */
    func createSearchResult(from movieData: Movies?, queryString: String) {
        
        queryResult = MoviesDataRepresentation(moviesData: movieData, queryString: queryString)
        if queryResult.movies.count > 0 {
            
            storage.save(name: queryString)
            searchResult.value = .success
        } else {
            
            searchResult.value = .noResult(error: noDataTextError)
        }
    }
    
    /**
     Append the movies data of the next page in the movies list.
     
     - parameter movieData: Movies data used update the pagination and movies list
     */
    func updateSearchResult(with movieData: Movies?) {
        
        queryResult.updateMoviesData(moviesData: movieData)
        searchResult.value = .success
    }
    
    /**
     Get the last 10 successful queries list from the data base.
     - returns: Return the movies list.
     */
    func getSearchHistory() -> [String] {
        
        return storage.searchHistory()
    }
}

//MARK:- CellRepresentable Protocol
extension MovieSearchViewModel: CellRepresentable {
    
    func numberOfRowsInSection() -> Int {
        
        return queryResult != nil ? queryResult.movies.count : 0
    }
    
    func cellInstance(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        // Dequeue a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: movieTableViewCellIdentifier, for: indexPath) as! MovieTableViewCell
        
        // Pass tableview cell a MovieCellData protocol object. Tableview cell doesnot need to know anbout the view model. This add a extra layer of security.
        cell.movie = queryResult.movies[indexPath.row]
        
        // Return the cell
        return cell
    }
}
