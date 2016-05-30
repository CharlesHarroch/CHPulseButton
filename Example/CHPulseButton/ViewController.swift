//
//  ViewController.swift
//  CHPulseButton
//
//  Created by Charles HARROCH on 05/25/2016.
//  Copyright (c) 2016 Charles HARROCH. All rights reserved.
//

import UIKit
import CHPulseButton

class ViewController: UIViewController {

    @IBOutlet var pulseButton : CHPulseButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClick() {
        pulseButton.animate(start: !pulseButton.isAnimate)
    }

}

