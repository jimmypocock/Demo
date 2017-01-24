//
//  Environment.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/24/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.

import Foundation

struct API {
    private static let baseURLString = Bundle.main.infoDictionary!["API_URL"] as! String

    static func campgroundSearchURL(_ query: String) -> URL {
        let escapedQuery = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? ""
        return URL(string: "\(baseURLString)campgrounds/search/\(escapedQuery)")!
    }
}
