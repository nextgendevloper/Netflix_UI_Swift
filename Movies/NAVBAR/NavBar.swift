//
//  leftClickableNavBar.swift
//  Premium
//
//  Created by SimplyEntertaining on 5/20/22.
//

import UIKit
import IOS_CommonUtil


class NavBar: ReusableNib,TextClickableInput{
    @IBOutlet weak var title : VerticalAlignLabel!
    @IBOutlet weak var subTitle : VerticalAlignLabel!
    @IBOutlet weak var rightButton : PTextButton!
    @IBOutlet weak var leftButton : ImageButton!
    

    override func commonInit() {
        title.textAlignment = .center
        title.verticalAlignment = .center
        title.text = "Manage Watermark"
        title.font = App.BoldFont(.VerySmall, iPadStyle: .Medium)
        title.verticalAlignment = .center
        title.adjustsFontSizeToFitWidth = true
        rightButton.isHidden = true
//        leftButton.image.image = UIImage(named: "home")
        self.backgroundColor = App.Primary
        rightButton.backgroundColor = .clear
    }
    
    
}
