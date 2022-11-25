//
//  ViewController.swift
//  Movies
//
//  Created by zmobile on 25/11/22.
//
     // MARK: - Imports
    import UIKit
    import IOSReusableCV
    import IOS_CommonUtil

class ViewController: UIViewController{

     // MARK: - OUTLETS
//    @IBOutlet weak var navbar:NavBar!
    @IBOutlet weak var tab:UIView!
    @IBOutlet weak var cv:UIView!
    
    // MARK: - Variables
    let viewModel = MoviesVM()
    
    // MARK: - Initializer
  

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
           super.viewDidLoad()
//        navbar.title.text = "Movies"
//        navbar.leftButton.isHidden = true
//        navbar.rightButton.isHidden = false
//        navbar.rightButton.title.text = "Done"
        viewModel.updateCurrentMoviesList(type: "SRK")
        self.addChildVCWithMultiplier(collectionView, toView: self.cv, aniamte: false)
        addChildVCWithMultiplier(tabbar, toView: self.tab, aniamte: true)
        
    
    }
    
    // MARK: - Binders
    func activateBinders(){
        
    }
    
    // MARK: - Actions
    func activateActions(){
        
    }
   
    // MARK: - Lazy Methods
         lazy var collectionView : ReusableCV = {
             
             let customLayout = ReusableCVLayout(forVerticalLayoutNumberOfColumn: 2)
             var myConfig = CVConfig(cellClass: MoviesCVC(), cellIdentifier: "MoviesCVC", reusableLayout: customLayout)
             return ReusableCV.createInstance(delegate: self, config: myConfig)
         }()
         
      lazy var tabbar:CustomBarVC = {
             let storyboard = UIStoryboard(name: "CustomBar", bundle: nil)
             let viewController = storyboard.instantiateViewController(withIdentifier: "CustomBarVC") as! CustomBarVC
             viewController.delegate = self
             viewController.view.clipsToBounds = true
             return viewController
         }()

    // MARK: - Private Functions
    
   
     }
    // MARK: - Extensions
extension ViewController :  ReusableCVDelegate {
    func numberOfSections(collectionview: UICollectionView) -> Int {
        return 1
    }
    
    func numberOfcells(collectionview: UICollectionView) -> Int {
        return viewModel.getNumberOfArray()
    }
    
    func configure(_ cell: UICollectionViewCell, at indexPath: IndexPath, for collectionview: UICollectionView) {
        if let cell = cell as? MoviesCVC{
//            cell.delegate = self
            let movie = viewModel.getMoviesTemplates(at: indexPath.item)
            cell.configureCell(movie: movie, at: indexPath)
            
        }
    }
    
    func didSelect(_ cell: UICollectionViewCell, at indexPath: IndexPath, for collectionview: UICollectionView) {
        print("hi")
    }
    
}
extension ViewController : CustomBarVCDelegate {
    func getCustomBarArrey() -> [String] {
        ["SRK","Imran"]
    }
    
    func getParentViewFrame() -> CGRect {
        self.view.frame
    }
    
    func didTapAtIndex(Index: Int, indexName: String) {
        if Index == 0{
            viewModel.updateCurrentMoviesList(type: "SRK")
            collectionView.refresh()
        }
        else{
            viewModel.updateCurrentMoviesList(type: "Imraan")
            collectionView.refresh()
        }
    }
    
    func getNavigationBarHeight() -> CGFloat {
        44
    }
    
}
