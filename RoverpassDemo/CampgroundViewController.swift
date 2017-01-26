//
//  CampgroundViewController.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/26/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//
//
//  CampgroundListViewController.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/25/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import UIKit

class CampgroundViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    
    var campground: Campground! {
        didSet {
            navigationItem.title = campground.name
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        nameLabel.text = campground.name
    }
}
