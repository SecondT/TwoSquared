//
//  View.swift
//  twosquared
//
//  Created by James Hartt on 17/12/2014.
//  Copyright (c) 2014 SecondT. All rights reserved.
//

import UIKit

class View: UIView {
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        self.customSetup()
    }

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.customSetup()
    }
    
    
    func customSetup() {
        
        self.backgroundColor = UIColor.redColor()
    }

}
