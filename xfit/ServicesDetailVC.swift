//
//  ServicesDetailVC.swift
//  xfit
//
//  Created by Dev1 on 3/10/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class ServicesDetailVC: UIViewController {

    var services: Services!
    var toggleRightDrawer: Bool?
    @IBOutlet weak var featuredImg: UIImageView!
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .Custom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        
        if let contentString = services.content {
        
            let attrString = NSMutableAttributedString(string: contentString)
            attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
            self.contentLbl.attributedText = attrString
            
        }
        
        self.titleLbl.text = services.title?.uppercaseString
        
        self.headerTitle.text = services.title?.uppercaseString
        
        if let url = services.featuredImg {
            self.featuredImg.image = UIImage(named: url)
        }
 
    }
    
    @IBAction func DetailsBackBtn(sender: AnyObject) {
        
        if toggleRightDrawer != true {
            self.navigationController?.popViewControllerAnimated(true)
        } else {
            self.evo_drawerController?.toggleRightDrawerSideAnimated(true, completion: nil)
        }
    }
    
    @IBAction func openProfile(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
}
