//
//  CampgroundCell.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/25/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import UIKit

class CampgroundCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        nameLabel.adjustsFontForContentSizeCategory = true
    }
}

