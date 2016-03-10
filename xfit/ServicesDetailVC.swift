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
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .Custom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
