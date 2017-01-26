//
//  Amenity.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/24/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import Foundation

class Amenity: NSObject {

    var name: String!

    init(jsonData: [String: Any]) {
        self.name = jsonData["name"] as! String!

        super.init()
    }
}
