//
//  OurSelfyCell.swift
//  xfit
//
//  Created by Dev1 on 3/11/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class OurSelfyCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImg: UIImageView!
    
    private var _selfy: Selfy?
    
    var selfy: Selfy? {
        return _selfy
    }
    
    override func drawRect(rect: CGRect) {
        featuredImg.clipsToBounds = true
    }
    
    
    func configureCell(selfy:Selfy) {
        
        self._selfy = selfy
        
        if selfy.featuredImg != nil {
            self.featuredImg.image = UIImage(named: selfy.featuredImg!)
        } else {
            self.featuredImg.hidden = true
        }
    }
    
}
