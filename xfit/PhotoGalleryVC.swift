//
//  PhotoGalleryVC.swift
//  xfit
//
//  Created by Dev1 on 3/11/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class PhotoGalleryVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
        @IBOutlet weak var collection: UICollectionView!
    
        let images = ["trainer1","trainer2","trainer3","trainer4","trainer5","trainer6"]
    
        override func viewWillAppear(animated: Bool) {
            self.navigationController?.navigationBarHidden = true
            self.evo_drawerController?.openDrawerGestureModeMask = .All
        }
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            parseData()
        }
        
        func parseData() {
            
            
            self.collection.reloadData()
        }
        
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PhotoGalleryCell", forIndexPath: indexPath) as? PhotoGalleryCell {
               
                let image = images[indexPath.row]
                
                cell.configureCell(image)
                
                return cell
            } else {
                return UICollectionViewCell()
            }
        }
        
        func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            
            let image = self.images[indexPath.row]
            performSegueWithIdentifier("ViewerVC", sender: image)
            
        }
        
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return self.images.count
            
        }
        
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            let screenSize: CGRect = UIScreen.mainScreen().bounds
            
            let screenWidth = (screenSize.width - 48)/3 - 2
            
            return CGSizeMake(screenWidth, screenWidth)
        }
        
        
        @IBAction func openMenu(sender: AnyObject) {
            self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
        }
        
        @IBAction func openProfile(sender: AnyObject) {
            self.navigationController?.popViewControllerAnimated(true)
        }
        
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "ViewerVC" {
                if let viewerVC = segue.destinationViewController as? ViewerVC {
                    if let img = sender as? String {
                        viewerVC.img = img
                    }
                }
            }
        }
    
    
}

