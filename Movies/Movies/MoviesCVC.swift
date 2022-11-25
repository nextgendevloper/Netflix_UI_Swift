//
//  MoviesCVC.swift
//  Movies
//
//  Created by zmobile on 25/11/22.
//

import UIKit

class MoviesCVC: UICollectionViewCell {
    @IBOutlet weak var poster:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(movie: MoviesDM, at: IndexPath){
        poster.image = movie.MovieImage
    }
}
