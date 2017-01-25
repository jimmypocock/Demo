//
//  Amenity.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/24/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

class Amenity: Mappable {

    var name: String!

    required init?(map: Map) {}

    // Mappable
    func mapping(map: Map) {
        name        <- map["name"]
    }
}
