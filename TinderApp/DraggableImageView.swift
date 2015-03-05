//
//  DraggableImageView.swift
//  TinderApp
//
//  Created by Brian Jordan on 3/4/15.
//  Copyright (c) 2015 Brian Jordan. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var cardInitialCenter: CGPoint!
    
    @IBAction func onPan(sender: UIPanGestureRecognizer) {
        let translation: CGPoint = sender.translationInView(contentView)
        
        switch sender.state {
        case UIGestureRecognizerState.Changed:
            let rotation = (translation.x / 500)
            self.imageView.transform = CGAffineTransformMakeRotation(rotation)
            self.imageView.center.x = self.cardInitialCenter.x + translation.x
            self.imageView.center.y = self.cardInitialCenter.y + translation.y
        case UIGestureRecognizerState.Ended:
            if (translation.x > 50) {
                self.flyToX(300)
            } else if (translation.x < 50) {
                self.flyToX(-300)
            } else {
                self.resetPosition()
            }
        default:
            print("") // better no-op?
        }
    }
    
    func flyToX(distance: CGFloat) {
        UIView.animateWithDuration(0.35, animations: {
            self.imageView.center.x += distance
            }, completion: { (bool: Bool) -> Void in
                self.resetAndFadeInCreepily()
        })
    }
    
    func resetAndFadeInCreepily() {
        self.resetPosition()
        self.imageView.alpha = 0
        UIView.animateWithDuration(0.5, animations: {
            self.imageView.alpha = 1.0
        })
    }
    
    func resetPosition() {
        self.imageView.center.x = self.cardInitialCenter.x
        self.imageView.center.y = self.cardInitialCenter.y
        self.imageView.transform = CGAffineTransformIdentity
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        
        self.cardInitialCenter = self.imageView.center

        // having trouble with nil optional error
        // would otherwise be set via unused `image` setter below
        imageView.image = UIImage(named: "Ryan")
    }
    
    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }

}
