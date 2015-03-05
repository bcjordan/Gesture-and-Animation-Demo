//
//  CardsViewController.swift
//  TinderApp
//
//  Created by Brian Jordan on 3/4/15.
//  Copyright (c) 2015 Brian Jordan. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var photoImageView: DraggableImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationViewController = segue.destinationViewController as ProfileViewController
        // TODO(bjordan): debug issue passing image from photoImageView—unexpectedly found nil?
        destinationViewController.image = UIImage(named: "Ryan") // self.photoImageView.imageView.image!
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
