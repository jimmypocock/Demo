//
//  Campground.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/24/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import Foundation

class Campground: NSObject {

    var name: String!

    // Designated Initializer
    init(name: String) {
        self.name = name

        super.init()
    }
}
