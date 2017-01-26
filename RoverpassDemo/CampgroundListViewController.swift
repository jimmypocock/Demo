//
//  CampgroundListViewController.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/25/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import UIKit
import Alamofire

class CampgroundListViewController: UITableViewController {

    var query: String?
    var campgrounds: NSArray = [] {
        didSet {
            print("RESPONSE: \(campgrounds.count) campgrounds received.")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = query

        searchForCampgrounds(query!, completion: { (response) in
            if response != nil {
                self.campgrounds = response!
            } else {
                print("API Response was nil. Could not retrieve campgrounds.")
            }
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campgrounds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // MARK: TODO: Need to populate CampgroundCell with campground objects.
        let cell = tableView.dequeueReusableCell(withIdentifier: "CampgroundCell", for: indexPath) as! CampgroundCell
        cell.nameLabel.text = "\(indexPath.row)"
        return cell
    }

    // MARK: TODO: Segue to Campground View
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // If the triggered segue is the "showItem" segue
//        switch segue.identifier {
//        case "showItem"?:
//            // Figure out which row was just tapped
//            if let row = tableView.indexPathForSelectedRow?.row {
//
//                // Get the item associated with this row and pass it along
//                let item = itemStore.allItems[row]
//                let detailViewController = segue.destination as! DetailViewController
//                detailViewController.item = item
//                detailViewController.imageStore = imageStore
//            }
//        default:
//            preconditionFailure("Unexpected segue identifier.")
//        }
//    }
}

extension CampgroundListViewController {
    func searchForCampgrounds(_ query: String, completion: @escaping (NSArray?) -> Void){
        let route = API.campgroundSearchURL(query)
        Alamofire.request(route, method: .get)
            .validate()
            .responseJSON { response in

                // Response was 400-500
                guard response.result.isSuccess else {
                    print("Error while fetching remote rooms: \(response.result.error)")
                    completion(nil)
                    return
                }

                // Response was not in form of NSArray
                guard let value = response.result.value as? NSArray else {
                    print("Malformed data received from searchForCampgrounds service")
                    completion(nil)
                    return
                }

                // MARK: TODO: Map response to be array of Campground objects: [Campground]
//                let campgrounds = value.flatMap({ (campground) -> Campground? in
//                    return Campground(name: campground[ as! String)
//                })

                completion(value)
        }
    }
}
