//
//  ContentMode.swift
//  twosquared
//
//  Created by James Hartt on 23/12/2014.
//  Copyright (c) 2014 SecondT. All rights reserved.
//

import Foundation
import UIKit

func rectForContentMode(bounds: CGRect, contentMode: UIViewContentMode, rect : CGRect) -> CGRect {
    
    var newRect = rect
    
    switch (contentMode) {
    case .ScaleToFill:
        return bounds;
        
    case .ScaleAspectFit:
        return rectAspectFit(newRect.size, bounds);
        
    case .ScaleAspectFill:
        return rectAspectFill(newRect.size, bounds);
        
    case .Redraw:
        // Invalid. Return .ScaleToFill
        return newRect;
        
    case .Center:
        newRect.origin.x = (bounds.size.width - newRect.size.width) / 2.0
        newRect.origin.y = (bounds.size.height - newRect.size.height) / 2.0
        return newRect;
        
    case .Top:
        newRect.origin.y = 0.0
        newRect.origin.x = (bounds.size.width - newRect.size.width) / 2.0
        return newRect;
        
    case .Bottom:
        newRect.origin.x = (bounds.size.width - newRect.size.width) / 2.0
        newRect.origin.y = bounds.size.height - newRect.size.height;
        return newRect;
        
    case .Left:
        newRect.origin.x = 0.0
        newRect.origin.y = (bounds.size.height - newRect.size.height) / 2.0
        return newRect;
        
    case .Right:
        newRect.origin.x = bounds.size.width - newRect.size.width;
        newRect.origin.y = (bounds.size.height - newRect.size.height) / 2.0
        return newRect;
        
    case .TopLeft:
        newRect.origin.x = 0.0
        newRect.origin.y = 0.0
        return newRect;
        
    case .TopRight:
        newRect.origin.x = bounds.size.width - newRect.size.width;
        newRect.origin.y = 0.0
        return newRect;
        
    case .BottomLeft:
        newRect.origin.x = 0.0
        newRect.origin.y = bounds.size.height - newRect.size.height;
        return newRect;
        
    case .BottomRight:
        newRect.origin.x = bounds.size.width - newRect.size.width;
        newRect.origin.y = bounds.size.height - newRect.size.height;
        return newRect;
    }
}


func sizeAspectFit(aspectRatio : CGSize, boundingSize : CGSize) -> CGSize {
    
    var newBoundingSize = boundingSize;
    
    let widthRatio = (newBoundingSize.width / aspectRatio.width);
    let heightRatio = (newBoundingSize.height / aspectRatio.height);
    if (widthRatio < heightRatio) {
        
        newBoundingSize.height = newBoundingSize.width / aspectRatio.width * aspectRatio.height;
    }
    else if (heightRatio < widthRatio) {
        
        newBoundingSize.width = newBoundingSize.height / aspectRatio.height * aspectRatio.width;
    }
    return CGSizeMake(ceil(newBoundingSize.width), ceil(newBoundingSize.height));
}


func sizeAspectFill(aspectRatio : CGSize, minimumSize : CGSize) -> CGSize {
    
    var newMinimumSize = minimumSize
    let widthRatio = (newMinimumSize.width / aspectRatio.width);
    let heightRatio = (newMinimumSize.height / aspectRatio.height);
    if (widthRatio > heightRatio) {
        
        newMinimumSize.height = newMinimumSize.width / aspectRatio.width * aspectRatio.height;
    }
    else if (heightRatio > widthRatio) {
        
        newMinimumSize.width = newMinimumSize.height / aspectRatio.height * aspectRatio.width;
    }
    return CGSizeMake(ceil(newMinimumSize.width), ceil(newMinimumSize.height));
}


func rectAspectFit(aspectRatio : CGSize, boundingRect : CGRect) -> CGRect {
    
    let size = sizeAspectFit(aspectRatio, boundingRect.size);
    var origin = boundingRect.origin;
    origin.x += (boundingRect.size.width - size.width) / 2.0;
    origin.y += (boundingRect.size.height - size.height) / 2.0;
    return CGRectMake(origin.x, origin.y, size.width, size.height);
}


func rectAspectFill(aspectRatio : CGSize, minimumRect : CGRect) -> CGRect {
    
    let size = sizeAspectFill(aspectRatio, minimumRect.size);
    var origin = CGPointZero;
    origin.x = (minimumRect.size.width - size.width) / 2.0;
    origin.y = (minimumRect.size.height - size.height) / 2.0;
    return CGRectMake(origin.x, origin.y, size.width, size.height);
}