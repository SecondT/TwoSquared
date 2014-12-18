//
//  Filter.swift
//  twosquared
//
//  Created by James Hartt on 18/12/2014.
//  Copyright (c) 2014 SecondT. All rights reserved.
//

import Foundation
import CoreImage

typealias Filter = CIImage -> CIImage

typealias Parameters = Dictionary<String, AnyObject>
    
    func pixelate(scale: Double) -> Filter {
        
        return { image in
            let middle = CGPointMake(image.extent().size.width/2, image.extent().size.height/2)
            let position = CIVector(CGPoint: middle)
            
            let parameters: Parameters = [
                "inputCenter" : position,
                "inputScale" : scale,
                kCIInputImageKey : image
            ]
            
            let filter = CIFilter(name: "CIPixellate", withInputParameters: parameters)
            
            return filter.outputImage
        }
    }
    
    func disolveTransition(time: Double) -> Filter {
        
        return { image in
            
            let inputTime = min(max(2.0 * (time - 0.25), 0.0), 1.0)
            
            let parameters: Parameters = [
                kCIInputTimeKey : inputTime,
                kCIInputImageKey : image
            ]
            
            let filter = CIFilter(name: "CIDissolveTransition", withInputParameters: parameters)
            
            return filter.outputImage
        }

    }
