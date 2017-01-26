//
//  CampgroundStore.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/26/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import UIKit

class CampgroundStore {

    var campgrounds = [Campground]()

    @discardableResult func addCampground(_ jsonData: [String: Any]) -> Campground {
        let newCampground = Campground(jsonData: jsonData)

        campgrounds.append(newCampground)

        return newCampground
    }

    init() {}
}
