//
//  ScheduleCell.swift
//  xfit
//
//  Created by Dev1 on 3/12/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class ScheduleCell: UITableViewCell {
        
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var placeLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var contentWrap: UIView!
    @IBOutlet weak var contentLbl: UILabel!
        
        private var _schedule: Schedule?
        
        var schedule: Schedule? {
            return _schedule
        }
        
        override func drawRect(rect: CGRect) {
            //        featuredImg.clipsToBounds = true
        }
        
        
        func configureCell(schedule: Schedule) {
            
            self._schedule = schedule
            
            if let title = schedule.title where title != "" {
                self.titleLbl.text = title.uppercaseString
            } else {
                self.titleLbl.text = nil
            }
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 8
            
            if let content = schedule.content where content != "" {
                
                let attrString = NSMutableAttributedString(string: content)
                attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
                self.contentLbl.attributedText = attrString
                
            } else {
                self.contentLbl.text = nil
            }
            
            if let time = schedule.time where time != "" {
                self.timeLbl.text = time.uppercaseString
            } else {
                self.timeLbl.text = nil
            }
            
            if let place = schedule.place where place != "" {
                self.placeLbl.text = place.uppercaseString
            } else {
                self.placeLbl.text = nil
            }
            
            if let duration = schedule.duration where duration != "" {
                self.durationLbl.text = duration.uppercaseString
            } else {
                self.durationLbl.text = nil
            }
            
        }
        
}
