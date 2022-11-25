//
//  MoviesVM.swift
//  Movies
//
//  Created by zmobile on 25/11/22.
//

import Foundation

//protocol PredefinedVMDelegate{
//    func onChange(_ dm:MoviesDM)
//    func onChangeDelete(dm:MoviesDM)
//    func onChangeNewPreset(dm:MoviesDM)
//}

protocol PredefinedVMInterface{
    var srkML : [MoviesDM]{get set}
    var imraanML :  [MoviesDM]{get set}
    var currentMoviesList : [MoviesDM]{get set}
//    var delegate : PredefinedVMDelegate?{get set}
//    var bindSelectedMovie:((MoviesDM)->())?{get set}
    var bindDismissOrRemove:(()->())?{get set}
//    var currentModel : MoviesDM{get set}
    func didChangeMovie(at iD:Int)
    func didDeleteMovie(at indexPath: IndexPath)
    func didAddNewMovie(model:MoviesDM)
}
class MoviesVM:PredefinedVMInterface{
    func didChangeMovie(at iD: Int) {
        print("hi")
    }
    
    func didDeleteMovie(at indexPath: IndexPath) {
        print("hi")
    }
    
    func didAddNewMovie(model: MoviesDM) {
        print("hi")
    }
    

    var srkML: [MoviesDM]
    
    var imraanML: [MoviesDM]
    
    var currentMoviesList: [MoviesDM]
    
//    var delegate: PredefinedVMDelegate?
    
//    var bindSelectedPreset: ((MoviesDM) -> ())?
    
    var bindDismissOrRemove: (() -> ())?
    
//    var currentModel: MoviesDM

    
    init(){
       
        imraanML = [MoviesDM]()
        srkML = [MoviesDM]()
        currentMoviesList = imraanML
        categoriesMovies()
        
    }

    func categoriesMovies(){
       currentMoviesList = [MoviesDM]()
        imraanML = [MoviesDM]()
        srkML = [MoviesDM]()
        for item in MoviesDM.getDefaultArray(){
            if item.actor == "SRK"{
                srkML.append(item)
            }
            else{
                imraanML.append(item)
            }
        }
    }
    
    func updateCurrentMoviesList(type:String){
        if type == "SRK"{
            currentMoviesList = srkML
            
        }
        else{
            currentMoviesList = imraanML
        }
    }
    
    func getNumberOfArray()->Int{
        return currentMoviesList.count
    }

    func getMoviesTemplates(at index:Int)->MoviesDM{
        return currentMoviesList[index]
    }
}
