//
//  Campground.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/24/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

class Campground: Mappable {

    var name: String!
    var slug: String!
    var bio: String?
    var city: String?
    var state: String?
    var latitude: Double?
    var longitude: Double?
//    var amenities: [Amenity]


    required init?(map: Map) {
        // MARK: Handle Amenity object creation.
    }

    // Mappable
    func mapping(map: Map) {
        name        <- map["name"]
        slug        <- map["age"]
        bio         <- map["bio"]
        city        <- map["city_name"]
        state       <- map["state_name"]
        latitude    <- map["latitude"]
        longitude   <- map["longitude"]
//        amenities   <- map["amenities"]
    }
}
