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

    @IBOutlet var roundButton : CHPulseButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        roundButton.animate(start: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

