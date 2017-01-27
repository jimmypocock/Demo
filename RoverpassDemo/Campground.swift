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
    var picture: Picture!

    init(jsonData: [String: Any]) {
        self.name = jsonData["name"] as! String!
        let pictureArray = jsonData["pictures"] as! [[String: String]]
        if pictureArray.count <= 0 {
            self.picture = Picture(nil)
        } else {
            self.picture = Picture(pictureArray.first?["url"])
        }

        super.init()
    }
}
