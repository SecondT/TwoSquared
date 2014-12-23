//
//  UIImageFilter.swift
//  twosquared
//
//  Created by James Hartt on 23/12/2014.
//  Copyright (c) 2014 SecondT. All rights reserved.
//

import Foundation
import UIKit

typealias UIImageFilter = UIImage -> UIImage

func resize(newHeight: CGFloat) -> UIImageFilter {
    
    return { image in
        
        let scale = newHeight / image.size.height
        
        let size = CGSizeApplyAffineTransform(image.size, CGAffineTransformMakeScale(scale, scale))
        let hasAlpha = false
        let screenScale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, screenScale)
        image.drawInRect(CGRect(origin: CGPointZero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        
        return scaledImage;
    }
}
