//
//  LeftSideVC.swift
//  xfit
//
//  Created by Dev1 on 3/9/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class LeftSideVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var menuItems:[String] = ["ГЛАВНАЯ","ЛИЧНЫЙ КАБИНЕТ","РАСПИСАНИЕ","НОВОСТИ","ЗАЧЕКИНИТЬСЯ","О КЛУБЕ","ФОТОТУР","УСЛУГИ","ТРЕНЕРА","НАШИ КЛИЕНТЫ","КОНТАКТЫ"];
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        //
        self.navigationController?.view.setNeedsLayout()
        //
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contentSizeDidChangeNotification:", name: UIContentSizeCategoryDidChangeNotification, object: nil)
        //
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuItems.count;
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 34.0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as! MenuCell
        
        cell.menuItemLbl.text = menuItems[indexPath.row].uppercaseString
        
        if indexPath.row == menuItems.count - 1 {
            cell.cellSeparatorView.hidden = true
        }
        
        return cell;
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch(indexPath.row)  {
            
        case 0:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuVC") as! MainMenuVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        case 1:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ProfileVC") as! ProfileVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        case 3:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("NewsVC") as! NewsVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;

        case 5:
            
            let refreshAlert = UIAlertController(title: "Log Out", message: "Log out baby. Log out...", preferredStyle: UIAlertControllerStyle.Alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
                let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("LogInVC") as UIViewController!
                let centerNav = UINavigationController(rootViewController: centerViewController)
                
                let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                
                appDelegate.drawerController!.centerViewController = centerNav
                appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: { (action: UIAlertAction!) in
                
            }))
            
            presentViewController(refreshAlert, animated: true, completion: nil)
            
            break;
            
        case 7:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ServicesVC") as! ServicesVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        case 8:
            
            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TrainersVC") as! TrainersVC
            let centerNav = UINavigationController(rootViewController: centerViewController)
            
            let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.drawerController!.centerViewController = centerNav
            appDelegate.drawerController!.toggleDrawerSide(.Left, animated: true, completion: nil)
            
            break;
            
        default:
            
            print("\(menuItems[indexPath.row]) is selected");
            
        }
        
    }
    
    
    
}

