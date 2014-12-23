//
//  View.swift
//  twosquared
//
//  Created by James Hartt on 17/12/2014.
//  Copyright (c) 2014 SecondT. All rights reserved.
//

import UIKit

class View: UIView {
    
    let questionLabel = UILabel()
    let imageViewTopLeft = CoreImageView(frame: CGRectMake(0, 0, 100, 100), context: nil)
    let imageViewTopRight = CoreImageView(frame: CGRectMake(0, 0, 100, 100), context: nil)
    let imageViewBottomRight = CoreImageView(frame: CGRectMake(0, 0, 100, 100), context: nil)
    let imageViewBottomLeft = CoreImageView(frame: CGRectMake(0, 0, 100, 100), context: nil)
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.createViews()
        self.customSetup()
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.createViews()
        self.customSetup()
    }
    
    
    func customSetup() {
        
        self.backgroundColor = UIColor.redColor()
    }
    
    func createViews() {
        
        questionLabel.backgroundColor = UIColor.clearColor()
        questionLabel.font = UIFont.systemFontOfSize(17)
        questionLabel.text = "Which of these is 💩?"
        questionLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(questionLabel)
        
        imageViewTopLeft.backgroundColor = UIColor.brownColor()
        imageViewTopLeft.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageViewTopLeft.contentMode = UIViewContentMode.ScaleAspectFill
        self.addSubview(imageViewTopLeft)
        
        imageViewTopRight.backgroundColor = UIColor.greenColor()
        imageViewTopRight.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageViewTopRight.contentMode = UIViewContentMode.ScaleAspectFill
       self.addSubview(imageViewTopRight)

        imageViewBottomRight.backgroundColor = UIColor.blueColor()
        imageViewBottomRight.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageViewBottomRight.contentMode = UIViewContentMode.ScaleAspectFill
        self.addSubview(imageViewBottomRight)

        imageViewBottomLeft.backgroundColor = UIColor.yellowColor()
        imageViewBottomLeft.setTranslatesAutoresizingMaskIntoConstraints(false)
        imageViewBottomLeft.contentMode = UIViewContentMode.ScaleAspectFill
        self.addSubview(imageViewBottomLeft)

        self.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        let views : Dictionary<NSObject, AnyObject> =
           ["questionLabel": questionLabel,
            "imageViewTopLeft": imageViewTopLeft,
            "imageViewTopRight": imageViewTopRight,
            "imageViewBottomRight": imageViewBottomRight,
            "imageViewBottomLeft": imageViewBottomLeft]
        
        let metrics : Dictionary<NSObject, NSObject> =
        ["padding" : 20,
            "labelHeight" : 40]
    
        var constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(padding)-[questionLabel]-(padding)-|", options: nil, metrics: metrics, views: views)
        
        self.addConstraints(constraints)
        
        constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(padding)-[imageViewTopLeft]-(padding)-[imageViewTopRight]-(padding)-|", options: nil, metrics: metrics, views: views)
        
        self.addConstraints(constraints)

        constraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-(padding)-[imageViewBottomLeft]-(padding)-[imageViewBottomRight]-(padding)-|", options: nil, metrics: metrics, views: views)
        
        self.addConstraints(constraints)
        
        constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|-(padding)-[questionLabel(labelHeight)]-(padding)-[imageViewTopLeft]-(padding)-[imageViewBottomLeft]", options: nil, metrics: metrics, views: views)
        
        self.addConstraints(constraints)
        
        constraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[questionLabel]-(padding)-[imageViewTopRight]-(padding)-[imageViewBottomRight]", options: nil, metrics: metrics, views: views)
        
        self.addConstraints(constraints)

        var constraint = NSLayoutConstraint(item: imageViewTopLeft, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: imageViewTopLeft, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        self.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: imageViewTopRight, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: imageViewTopRight, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        self.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: imageViewTopRight, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: imageViewTopLeft, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        
        self.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: imageViewBottomLeft, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: imageViewBottomLeft, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        self.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: imageViewBottomRight, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: imageViewBottomRight, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 0)
        
        self.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: imageViewBottomRight, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: imageViewBottomLeft, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 0)
        
        self.addConstraint(constraint)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
