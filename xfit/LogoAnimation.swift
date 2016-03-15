//
//  LogoAnimation.swift
//  xfit
//
//  Created by Dev1 on 3/15/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//
import Foundation
import UIKit

class LogoAnimation: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        logoAnimation()
    }
    
    
    func logoAnimation() {
        self.image = UIImage(named: "xfit_81.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        for var x = 0; x <= 81; x++ {
            let img = UIImage(named: "xfit_\(x).png")
            
            imgArray.append(img!)
        }
        
        self.animationImages = imgArray
        self.animationDuration = 2.21
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
}