//
//  MoviesDM.swift
//  Movies
//
//  Created by zmobile on 25/11/22.
//

import Foundation
import UIKit

class MoviesDM{
    var movieName:String?
    var MovieImage:UIImage?
    var actor:String?
    
    init(mName:String,mImg:String,cast:String){
        movieName = mName
        MovieImage = UIImage(named: mImg)!
        actor = cast
    }
    static func getDefaultArray()->[MoviesDM]{
     let array = [MoviesDM(mName: "Awarapan", mImg: "Awarapan", cast: "Imran Hasmi"),
                  MoviesDM(mName: "Tum Mile", mImg: "TumMile", cast: "Imran Hasmi"),
                  MoviesDM(mName: "Azhar", mImg: "Azhar", cast: "Imran Hasmi"),
                  MoviesDM(mName: "Adhuri Kahani", mImg: "Kahani", cast: "Imran Hasmi"),
                  MoviesDM(mName: "Sanghai", mImg: "Sanghai", cast: "Imran Hasmi"),
                  MoviesDM(mName: "Murder 2", mImg: "Murder2", cast: "Imran Hasmi"),
                  MoviesDM(mName: "Gangster", mImg: "Gangaster", cast: "Imran Hasmi"),
                  MoviesDM(mName: "Jannat", mImg: "Jannat", cast: "Imran Hasmi"),
                  MoviesDM(mName: "Zeher", mImg: "Zeher", cast: "Imran Hasmi"),
                  MoviesDM(mName: "Baazigar", mImg: "Baazigar", cast: "SRK"),
                  MoviesDM(mName: "Don", mImg: "Don", cast: "SRK"),
                  MoviesDM(mName: "Mohabatein", mImg: "Mohabatein", cast: "SRK"),
                  MoviesDM(mName: "Veer Zara", mImg: "VeerZara", cast: "SRK"),
                  MoviesDM(mName: "Ra-One", mImg: "RaOne", cast: "SRK"),
                  MoviesDM(mName: "Kal Ho Na Ho", mImg: "KHNH", cast: "SRK"),
                  MoviesDM(mName: "Pardes", mImg: "Pardes", cast: "SRK"),
                  MoviesDM(mName: "My Name Is Khan", mImg: "Khan", cast: "SRK"),
                  MoviesDM(mName: "Raees", mImg: "Raees", cast: "SRK"),
     ]
        return array
    }
}
