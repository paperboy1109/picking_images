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
    
    let pickerController = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pickerController.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func pickAnImage(sender: AnyObject) {
        
        // let pickerController = UIImagePickerController()
        
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

