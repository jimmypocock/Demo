//
//  Environment.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/24/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.

import Foundation

struct Environment {
    static func apiURL() -> URL? {
        guard let url = Bundle.main.infoDictionary!["API_URL"] as! String? else { return nil }
        return URL(string: url)!
    }
}
