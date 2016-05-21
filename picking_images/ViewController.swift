//
//  ViewController.swift
//  picking_images
//
//  Created by Daniel J Janiak on 5/21/16.
//  Copyright © 2016 Daniel J Janiak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var imagePickerView: UIImageView!
    @IBOutlet var cameraBtn: UIBarButtonItem!
    
    let pickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerController.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        cameraBtn.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    // Actions when toolbar buttons are tapped 
    
    @IBAction func pickAnImage(sender: AnyObject) {
        
        // let pickerController = UIImagePickerController()
        
        pickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(pickerController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func pickCameraImg(sender: AnyObject) {
        
        pickerController.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(pickerController, animated: true, completion: nil)
        
    }
    
    
    
    // Two methods needed for UIImagePickerControllerDelegate
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imagePickerView.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        // For debugging learning
        print("imagePickerControllerDidCancel called")
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}

