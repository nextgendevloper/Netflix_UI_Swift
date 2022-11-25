//
//  CustomBarCVC.swift
//  FabInvitation
//
//  Created by zmobile on 01/08/19.
//  Copyright © 2019 irissolutions. All rights reserved.
//

import UIKit
import IOS_CommonUtil

class CustomBarCVC: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var highlightView: UIView!
    
     let identifier = "CustomBarCVC"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(text:String,isSelected:Bool) {
       // self.highlightView.cornerRadius = 2
        self.textLabel.text = text
        self.textLabel.backgroundColor = .clear
        self.textLabel.font = App.RegularFont(.ExtraSmall, iPadStyle: .VerySmall)
        if isSelected {
            self.highlightView.backgroundColor = App.ThemeColor
            textLabel.textColor = App.ThemeColor

        }else{
            self.highlightView.backgroundColor = UIColor.clear
            textLabel.textColor = App.DefaultColor

        }
        self.backgroundColor = .clear
    }
     
}
