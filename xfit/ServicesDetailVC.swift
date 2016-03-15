//
//  ServicesDetailVC.swift
//  xfit
//
//  Created by Dev1 on 3/10/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit
import ImageSlideshow

class ServicesDetailVC: UIViewController {

    var services: Services!
    var toggleRightDrawer: Bool?
    @IBOutlet weak var featuredImg: UIImageView!
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet var slideshow: ImageSlideshow!
    var transitionDelegate: ZoomAnimatedTransitioningDelegate?
    
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
//            self.featuredImg.image = UIImage(named: url)
        }
        
        slideshow.backgroundColor = UIColor(red: 2535/255, green: 255/255, blue: 255/255, alpha: 0.0);
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.InsideScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor(red: 253/255, green: 218/255, blue: 0/255, alpha: 1.0);
        slideshow.pageControl.pageIndicatorTintColor = UIColor.lightGrayColor();
        
        slideshow.setImageInputs([ImageSource(imageString: "trainer1")!, ImageSource(imageString: "trainer2")!, ImageSource(imageString: "trainer3")!, ImageSource(imageString: "trainer4")!])
        
        let recognizer = UITapGestureRecognizer(target: self, action: "click")
        slideshow.addGestureRecognizer(recognizer)
 
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
    
    func click() {
        let ctr = FullScreenSlideshowViewController()
        ctr.pageSelected = {(page: Int) in
            self.slideshow.setScrollViewPage(page, animated: false)
        }
        
        ctr.initialPage = slideshow.scrollViewPage
        ctr.inputs = slideshow.images
        self.transitionDelegate = ZoomAnimatedTransitioningDelegate(slideshowView: slideshow);
        ctr.transitioningDelegate = self.transitionDelegate!
        self.presentViewController(ctr, animated: true, completion: nil)
    }
    
}
