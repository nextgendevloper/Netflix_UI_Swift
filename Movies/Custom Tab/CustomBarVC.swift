//
//  CustomBarVC.swift
//  FabInvitation
//
//  Created by zmobile on 01/08/19.
//  Copyright © 2019 irissolutions. All rights reserved.
//

import UIKit
//MARK: ................Protocol.................
//hk changed class -> anyobject
protocol CustomBarVCDelegate:AnyObject {
    func getCustomBarArrey() -> [String]
    func getParentViewFrame() -> CGRect
    func didTapAtIndex(Index:Int,indexName:String)
    func getNavigationBarHeight() -> CGFloat // for top
}

class CustomBarVC: UIViewController {

    
    //MARK: ................. IB Outlet .................
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    
    //MARK: ................. Properties .................
    
    static let identifier = "CustomBarVC"
    private let requiredHeight:CGFloat = 40
    
    weak var delegate:CustomBarVCDelegate?
    
    private var dataArrey = [String]()
    public var selectedIndex = 0 {
        didSet {
            self.selectedIndexIsChanged(Index: selectedIndex)
        }
    }
    
        
    //MARK:..............View Life Cycle ...............
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inetialSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        myCollectionView.reloadData()
    }
    //MARK:..............Inetializer/DeInetializer ...............
    deinit {
        print("CustomBarVC is gone")
    }
    //MARK: ................. IB Actions .................
    
    //MARK: ................. Methods .................
    
    
    func addDefaultVC () {
        if self.dataArrey.count > 0 {
            self.selectedIndex = 0
        }
    }
    
    func getCurrentTabIndex()->Int{
        return selectedIndex
    }
    func updateCustomVCIndex(index:Int) {
        if index >= 0 || index < dataArrey.count {
            self.selectedIndex = index
        }
    }
    
    func moveToNextIndex() {
        if self.selectedIndex < dataArrey.count - 1 {
            self.selectedIndex = self.selectedIndex + 1
        }
    }
    
    func moveToPreviousIndex() {
        if self.selectedIndex > 0 {
            self.selectedIndex = self.selectedIndex - 1
        }
    }
    
    func getFrame() -> CGRect? {
        guard let parentFrame:CGRect = self.delegate?.getParentViewFrame() else {return nil}
//        guard let topPadding = getTopPadding() else{return nil}
        let frameX:CGFloat = 0
        let framewidth:CGFloat = parentFrame.size.width
        let frameheight:CGFloat = self.requiredHeight
//        let frameY:CGFloat = topPadding+frameheight;//parentFrame.size.height - bottomPadding  - frameheight
        let frame = CGRect(x: frameX, y: 0, width: framewidth, height: frameheight)
        return frame
    }
    
    func getFrameForDesginerVC() -> CGRect? {
        guard let parentFrame:CGRect = self.delegate?.getParentViewFrame() else {return nil}
//        guard let topPadding = getTopPadding() else{return nil}
        //hk changed
        guard (self.delegate?.getNavigationBarHeight()) != nil else {return nil}
        let frameX:CGFloat = 0
        let framewidth:CGFloat = parentFrame.size.width
        let frameheight:CGFloat = self.requiredHeight
//        let frameY:CGFloat = topPadding + navBarHeight
        let frame = CGRect(x: frameX, y: 0, width: framewidth, height: frameheight)
        return frame
    }
    
    func getCustomBarRequiredHeight() -> CGFloat {
        return self.requiredHeight
    }
    
    //MARK: .................Private Methods .................
    private func inetialSetup() {
        self.view.backgroundColor = UIColor(named: "DarkColor")
        if let arrey = self.delegate?.getCustomBarArrey() {
            self.dataArrey = arrey
        }
        let myNib = UINib(nibName:"CustomBarCVC", bundle: nil)
        self.myCollectionView.register(myNib, forCellWithReuseIdentifier: CustomBarCVC.identifier)
        self.myCollectionView.delegate = self
        self.myCollectionView.dataSource = self
    }
    
    public func updateCategory(){
        if let arrey = self.delegate?.getCustomBarArrey() {
            self.dataArrey = arrey
        }
        myCollectionView.reloadData()
    }
    
    private func selectedIndexIsChanged(Index:Int) {
        self.myCollectionView.reloadData()
        let name = self.dataArrey[selectedIndex]//.cCategoryName!
        self.delegate?.didTapAtIndex(Index: selectedIndex, indexName: name)
        let indxPath = IndexPath(item: Index, section: 0)
        
        if Index == 0 {
            self.myCollectionView.scrollToItem(at: indxPath, at: .left, animated: true)
        }
        else if Index == self.dataArrey.count - 1 {
            self.myCollectionView.scrollToItem(at: indxPath, at: .right, animated: true)
        }else{
            self.myCollectionView.scrollToItem(at: indxPath, at: .centeredHorizontally, animated: true)
        }
    }
    
}


//MARK: ................Extensions.................

//MARK: UI Collection View Data Source
extension CustomBarVC:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArrey.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: CustomBarCVC.identifier, for: indexPath) as! CustomBarCVC
        let name = self.dataArrey[indexPath.item]//.cCategoryName!
        if self.selectedIndex == indexPath.item {
            cell.configure(text: name, isSelected: true)
        }else{
            cell.configure(text: name, isSelected: false)
        }
        return cell
    }
}

//MARK: UI Collection View Delegate
extension CustomBarVC:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.item
    }
}

//MARK: UI Collection View Flow Layout
extension CustomBarVC:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = (self.view.frame.size.width) / 2
        let hight:CGFloat = self.view.frame.size.height
        let size = CGSize(width: width, height: hight)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
