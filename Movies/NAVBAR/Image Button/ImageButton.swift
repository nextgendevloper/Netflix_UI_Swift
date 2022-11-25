//
//  ImageButton.swift
//  Premium
//
//  Created by SimplyEntertaining on 5/16/22.
//

import UIKit
import IOS_CommonUtil

class ImageButton: ImageClickableBaseClass{
    
    override func onStateDefault() {
        self.backgroundColor = .clear
        self.contentScaleFactor = 1
        self.layer.opacity = 1
        self.layer.cornerRadius = 0
        self.transform = CGAffineTransform.identity
        self.layer.cornerRadius = self.frame.width/2
    }
    override func onStateHighlight() {
        
        self.layer.cornerRadius = self.frame.width/2
        self.layer.opacity = 0.7
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
    }
    override func onStateDisable() {
        self.image.tintColor = App.DefaultLight
    }
    override func commonInit(){
        super.commonInit()
       
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
