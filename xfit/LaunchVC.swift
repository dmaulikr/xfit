//
//  LaunchVC.swift
//  xfit
//
//  Created by Dev1 on 3/15/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//
import UIKit
import AVKit
import AVFoundation

class LaunchVC: UIViewController {
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .Custom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.greenColor()
        
        // Use a local or remote URL
        let path = NSBundle.mainBundle().pathForResource("Launch", ofType:"mp4")
        let url = NSURL.fileURLWithPath(path!)
        
        // Make an AVPlayer
        let avPlayer = AVPlayer(URL: url)
        avPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "playerItemDidReachEnd:",
            name: AVPlayerItemDidPlayToEndTimeNotification,
            object: avPlayer.currentItem)
        avPlayer.play()
        
        // Make the AVPlayerLayer and add it to self.view's layer
        let avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.frame = self.view.bounds
        
        /*
        @abstract       A string defining how the video is displayed within an AVPlayerLayer bounds rect.
        @discusssion    Options are AVLayerVideoGravityResizeAspect, AVLayerVideoGravityResizeAspectFill
        and AVLayerVideoGravityResize. AVLayerVideoGravityResizeAspect is default.
        See <AVFoundation/AVAnimation.h> for a description of these options.
        */
        avPlayerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        avPlayerLayer.zPosition = -1
        
        self.view.layer.addSublayer(avPlayerLayer)
    }
    
    func playerItemDidReachEnd(notification: NSNotification) {
//        let avPlayerItem: AVPlayerItem = notification.object as! AVPlayerItem
//        avPlayerItem.seekToTime(kCMTimeZero)
        let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainMenuVC") as! MainMenuVC
        let centerNav = UINavigationController(rootViewController: centerViewController)
        
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.drawerController!.centerViewController = centerNav
    }
    
}