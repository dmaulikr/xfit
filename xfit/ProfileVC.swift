//
//  ProfileVC.swift
//  xfit
//
//  Created by Dev1 on 3/9/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .All
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func openMenu(sender: AnyObject) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
        
    }
    
}
