//
//  ViewController.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/23/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let url: URL = API.campgroundSearchURL("austin texas")
        print("\(url)")
    }
}

