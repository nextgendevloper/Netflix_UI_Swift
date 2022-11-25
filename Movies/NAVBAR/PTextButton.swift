//
//  TextButton.swift
//  Premium
//
//  Created by SimplyEntertaining on 5/20/22.
//

import UIKit
import IOS_CommonUtil

class PTextButton: TextClickableBaseClass{
    
    override func onStateDefault() {
        self.title.layer.opacity = 1
        self.title.textColor = App.ThemeColor
      
    }
    override func onStateHighlight() {
        self.title.layer.opacity = 0.7
        
    }

    override func onStateDisable() {
        self.title.textColor = App.DefaultLight
    }
    override func commonInit() {
        super.commonInit()
        title.adjustsFontSizeToFitWidth = true
        title.verticalAlignment = .center
        title.textAlignment = .center
        self.sizeToFit()
        
    clickable.onStateDefault = { [self] in
        onStateDefault()
        
    }
    clickable.onStateHighlighted = { [self] in
        onStateHighlight()
    }
        clickable.onStateDisable = { [self] in
        onStateDisable()
    }
   
    clickable.setDefaultState()
        
       
    }
}


