//
//  SearchViewController.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/24/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import UIKit
import Alamofire

// MARK: Look up: UISearchContainerViewController
class SearchViewController: UIViewController {

    var campgrounds: Alamofire.Request? {
        didSet {
            print("\(campgrounds)")
        }
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        campgrounds = searchForCampgrounds("austin texas")
        //        let results = searchForCampgrounds("austin texas"completionHandler: , completionHandler: {
        //            print(self ?? [])
        //        })

        //        searchForCampgrounds("austin texas") { campgrounds in
        ////            completion(campgrounds, [Campground]())
        //        }

    }

    func searchForCampgrounds(_ query: String) -> Request? {
        let route = API.campgroundSearchURL(query)
        return Alamofire.request(route, method: .get)
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(response.result.error)")
                    return
                }

                guard ((response.result.value as? NSArray) != nil) else {
                    print("Malformed data received from searchForCampgrounds service")
                    return
                }
        }
    }

//    func searchForCampgrounds(completion: @escaping ([Campground]?) -> Void) {
//        let route = API.campgroundSearchURL("austin texas")
//        Alamofire.request(route, method: .get)
//        .validate()
//        .responseJSON { response in
//            print(response)
//        }
//    }

//    func fetchAllRooms(completion: @escaping ([Campground]?) -> Void) {
//        Alamofire.request(
//            URL(string: "http://localhost:5984/rooms/_all_docs")!,
//            method: .get,
//            parameters: ["include_docs": "true"])
//            .validate()
//            .responseJSON { (response) -> Void in
//                guard response.result.isSuccess else {
//                    print("Error while fetching remote rooms: \(response.result.error)")
//                    completion(nil)
//                    return
//                }
//
//                guard let value = response.result.value as? [String: Any],
//                    let rows = value["rows"] as? [[String: Any]] else {
//                        print("Malformed data received from fetchAllRooms service")
//                        completion(nil)
//                        return
//                }
//                
//                let rooms = rows.flatMap({ (roomDict) -> RemoteRoom? in
//                    return RemoteRoom(jsonData: roomDict)
//                })
//                
//                completion(rooms)
//        }
//    }
}
