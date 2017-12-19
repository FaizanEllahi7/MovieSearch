//
//  MovieTableViewCell.swift
//  MovieSearch
//
//  Created by Faizan Ellahi on 12/13/17.
//  Copyright © 2017 Faizan Ellahi. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    //MARK:- Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    
    //MARK:- Variables
    var movie: MovieRepresentable? {
        didSet {
            setupCell()
        }
    }
    
    //MARK:- Setup Cell
    override func prepareForReuse() {
        
        nameLabel.text = ""
        dateLabel.text = ""
        overviewLabel.text = ""
        posterImage.image = nil
    }
    
    func setupCell() {
        
        nameLabel.text = movie?.movieName
        dateLabel.text = movie?.movieDate
        overviewLabel.text = movie?.movieOverview
        posterImage.loadImageUsingCacheWithURLString(movie!.moviePoster, placeHolder: nil) { (bool) in
            
        }
    }
    
}
