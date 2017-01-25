//
//  HomeViewController.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/24/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func buttonClicked(_ sender: UIButton) {
        let url: URL = API.campgroundSearchURL("austin texas")
        print("Button Clicked! URL: \(url)")
    }
}

