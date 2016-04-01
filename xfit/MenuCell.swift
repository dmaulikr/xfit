//
//  MenuCell.swift
//  xfit
//
//  Created by Dev1 on 3/9/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet weak var menuItemLbl: UILabel!
    @IBOutlet weak var cellSeparatorView: UIView!
    @IBOutlet weak var cellView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}