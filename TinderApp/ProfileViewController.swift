//
//  ProfileViewController.swift
//  TinderApp
//
//  Created by Brian Jordan on 3/4/15.
//  Copyright (c) 2015 Brian Jordan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var image: UIImage!

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func donePressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
