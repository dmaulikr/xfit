//
//  CheckInVC.swift
//  xfit
//
//  Created by Ingwar on 3/17/16.
//  Copyright © 2016 fxofficeapp. All rights reserved.
//

import UIKit

class CheckInVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker: UIImagePickerController!
    var PhotoWrapper: UIView!
    @IBOutlet weak var PhotoView: UIView!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        self.evo_drawerController?.openDrawerGestureModeMask = .All
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self

        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor(red: 97/255, green: 97/255, blue: 97/255, alpha: 0.17).CGColor
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        
        
        let img = UIImageView(image: image)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        
        PhotoView.addSubview(img)

        
    }
    
    @IBAction func selectImage(sender: UITapGestureRecognizer) {
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func openMenu(sender: AnyObject) {
        self.evo_drawerController?.toggleDrawerSide(.Left, animated: true, completion: nil)
        
    }
    
    @IBAction func openProfile(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    

}
