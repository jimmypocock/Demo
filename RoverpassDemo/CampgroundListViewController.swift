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
    var campgroundStore = CampgroundStore()

    func addCampgroundToTable(_ campground: Campground) {
        // Figure out where that item is in the array
        if let index = campgroundStore.campgrounds.index(of: campground) {
            let indexPath = IndexPath(row: index, section: 0)

            // Insert this new row into the table
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = query

        searchForCampgrounds(query!, completion: { (response) in
            if response != nil {
                for campground in response! {

                    let newCampground = self.campgroundStore.addCampground(campground)
                    self.addCampgroundToTable(newCampground)
                }
            } else {
                print("API Response was nil. Could not retrieve campgrounds.")
            }
        })
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campgroundStore.campgrounds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CampgroundCell", for: indexPath) as! CampgroundCell

        let campground = campgroundStore.campgrounds[indexPath.row]
        cell.nameLabel.text = campground.name

        return cell
    }

    // MARK: TODO: Segue to Campground View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        switch segue.identifier {
        case "campgroundSegue"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {

                
                let campground = campgroundStore.campgrounds[row]
                let campgroundViewController = segue.destination as! CampgroundViewController
                campgroundViewController.campground = campground
            }
        case "homeSegue"?: break
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
}

extension CampgroundListViewController {
    func searchForCampgrounds(_ query: String, completion: @escaping ([[String:Any]]?) -> Void){
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

                // Response was not in form of [String:Any]
                guard let value = response.result.value as? [[String:Any]] else {
                    print("Malformed data received from searchForCampgrounds service")
                    completion(nil)
                    return
                }

                completion(value)
        }
    }
}
