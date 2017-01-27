//
//  Picture.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/26/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import Foundation

class Picture: NSObject {

    let defaultPictureUrl = "https://dev.roverpass.com/images/large/missing.png"
    var url: URL!

    init(_ urlString: String?) {
        if urlString != nil {
            self.url = URL(string: urlString!)
        } else {
            self.url = URL(string: defaultPictureUrl)
        }

        print("Picture URL: \(self.url)")
        super.init()
    }
}
