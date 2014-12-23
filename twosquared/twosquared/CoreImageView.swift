//
//  CoreImageView.swift
//  twosquared
//
//  Created by James Hartt on 23/12/2014.
//  Copyright (c) 2014 SecondT. All rights reserved.
//

import Foundation
import GLKit
import UIKit

class CoreImageView : GLKView {
    
    var image : CIImage? {
        didSet {
            self._display()
        }
    }
        
    override init!(frame: CGRect, context: EAGLContext!) {
        
        let context = EAGLContext(API: EAGLRenderingAPI.OpenGLES2)
        
        super.init(frame: frame, context: context)
        
        self.userInteractionEnabled = false
        self.enableSetNeedsDisplay = true
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var ciContext : CIContext? = {
        
        var temporaryContext: CIContext = CIContext(EAGLContext: self.context, options: self.contextOptions())
        
        return temporaryContext
        }()
    
    override var contentMode : UIViewContentMode {
        
        didSet {
            self._display()
        }
    }
    
    func contextOptions() -> Dictionary<String, AnyObject> {
        
        return [
            kCIContextUseSoftwareRenderer: false,
            kCIContextWorkingColorSpace: NSNull()
        ]
    }
    
    override func layoutSubviews() {
        
        self._display();
    }
    
    override func drawRect(rect: CGRect) {
        
        if self.window==nil || self.image == nil {
            return
        }
        
        let size = self.bounds.size
        let scale = self.contentScaleFactor
        let bounds = CGRectMake(0.0, 0.0, size.width*scale, size.height*scale)
        let imageRect = self.imageRectForBounds(self.bounds)
        
        if let context = self.ciContext {
            context.drawImage(self.image, inRect: bounds, fromRect: imageRect)
        }
    }
    
    func imageRectForBounds(bounds: CGRect) -> CGRect {
        
        var newBounds = bounds
        
        newBounds.size.width = bounds.size.width*self.contentScaleFactor;
        newBounds.size.height = bounds.size.height*self.contentScaleFactor;
        
        return rectForContentMode(newBounds, self.contentMode, self.image!.extent())
    }
    
    private func _display() {

        if(self.enableSetNeedsDisplay) {
            
            self.setNeedsDisplay()
        } else {
            
            self.display()
        }
    }    
}