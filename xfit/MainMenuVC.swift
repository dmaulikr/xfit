//
//  MainMenuVC.swift
//  xfit
//
//  Created by Dev1 on 3/9/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {
    
    @IBOutlet weak var scrllView: UIScrollView!
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .Custom
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func NewsViewBtn(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
   
    @IBAction func TrainersViewBtn(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func ServicesViewBtn(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func contactsViewBtn(sender: AnyObject) {
        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
