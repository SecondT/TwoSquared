//
//  ViewController.swift
//  twosquared
//
//  Created by James Hartt on 17/12/2014.
//  Copyright (c) 2014 SecondT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func loadView() {
        
        super.loadView()
        
        self.view = View(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height))
    }
}

