//
//  ViewController.swift
//  twosquared
//
//  Created by James Hartt on 17/12/2014.
//  Copyright (c) 2014 SecondT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func loadView() {
        
        super.loadView()
        
        self.view = View(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        super.viewDidAppear(animated)
        
        let view = self.view as View
        
        let resizeFilter = resize(view.imageViewTopLeft.frame.size.height)
        let pixelatedFilter = pixelate(8)

        let firstUIImage = UIImage(named: "Kitten1.jpg")
        let resizedFirstUIImage = resizeFilter(firstUIImage!)
        
        let firstCIKittenImage = CIImage(image: resizedFirstUIImage)
        
        let firstPixelatedCIKitten = pixelatedFilter(firstCIKittenImage)
        
        view.imageViewTopLeft.contentMode = UIViewContentMode.ScaleToFill
        view.imageViewTopLeft.image = firstPixelatedCIKitten

        let secondUIImage = UIImage(named: "Kitten2.jpg")
        let secondResizedUIImage = resizeFilter(secondUIImage!)
        
        let secondCIKittenImage = CIImage(image: secondResizedUIImage)
        
        let secondPixelatedCIKitten = pixelatedFilter(secondCIKittenImage)
        
        view.imageViewTopRight.contentMode = UIViewContentMode.ScaleToFill
        view.imageViewTopRight.image = secondPixelatedCIKitten
        
        
        
        let thirdUIImage = UIImage(named: "Kitten3.jpg")
        let thirdResizedUIImage = resizeFilter(thirdUIImage!)
        
        let thirdCIKittenImage = CIImage(image: thirdResizedUIImage)
        
        let thirdPixelatedCIKitten = pixelatedFilter(thirdCIKittenImage)
        
        view.imageViewBottomLeft.contentMode = UIViewContentMode.ScaleToFill
        view.imageViewBottomLeft.image = thirdPixelatedCIKitten

        
        let fourthUIImage = UIImage(named: "Kitten4.jpg")
        let fourthResizedUIImage = resizeFilter(fourthUIImage!)
        
        let fourthCIKittenImage = CIImage(image: fourthResizedUIImage)
        
        let fourthPixelatedCIKitten = pixelatedFilter(fourthCIKittenImage)
        
        view.imageViewBottomRight.contentMode = UIViewContentMode.ScaleToFill
        view.imageViewBottomRight.image = fourthPixelatedCIKitten
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

