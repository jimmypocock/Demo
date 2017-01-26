//
//  HomeViewController.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/24/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.

import UIKit
import CoreLocation
import GooglePlaces

// MARK: TODO: Finish campgroundsNearMe functionality by sending to campground list page with search query.
class HomeViewController: UIViewController {

    // MARK: Properties
    var placesClient: GMSPlacesClient!
    var locationManager = CLLocationManager()

    // Will be sent to CampgroundListViewController to find campgrounds through API
    var query: String?

    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?

    // MARK: Outlets
    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
    @IBOutlet var campgroundsNearMeButton: UIButton!

    // MARK: Actions
    // Add a UIButton in Interface Builder, and connect the action to this function.
    @IBAction func getCurrentPlace(_ sender: UIButton) {

        // MARK: TODO: Should only go through places function if user selects allow location.
        checkLocationAuthorizationStatus()

        placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }

            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {

                    self.query = place.formattedAddress?.components(separatedBy: ", ").joined(separator: " ") ?? place.name
                    print("\(self.query)")
                    self.performSegue(withIdentifier: "campgroundListSegue", sender: self)
                }
            }
        })
    }

    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: TODO: Need to set region filter here. And only find places in the US.
        placesClient = GMSPlacesClient.shared()

        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self

        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController

        let subView = UIView(frame: CGRect(x: 0, y: (campgroundsNearMeButton.frame.maxY + 22), width: view.frame.width, height: 45.0))

        subView.addSubview((searchController?.searchBar)!)
        view.addSubview(subView)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = false

        // When UISearchController presents the results view, present it in
        // this view controller, not one further up the chain.
        definesPresentationContext = true
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "campgroundListSegue" {

            // MARK: Send query variable to CampgroundListViewController
            let navigationController = segue.destination as! UINavigationController
            let campgroundListViewController = navigationController.topViewController as! CampgroundListViewController
            print("QUERY: \(query)")
            campgroundListViewController.query = query
        }
    }
}

// MARK: Location Manager Extension
extension HomeViewController: CLLocationManagerDelegate {
    func checkLocationAuthorizationStatus() {
        // MARK: TODO: Need to test if they don't allow authorization
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            locationManager.delegate = self
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
}

// MARK: Google Autocomplete Extension
extension HomeViewController: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {

        // Set query and send to campground list view
        self.query = place.formattedAddress?.components(separatedBy: ", ").joined(separator: " ") ?? place.name
        self.performSegue(withIdentifier: "campgroundListSegue", sender: self)
    }

    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: Error){
        // MARK: TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }

    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    func didUpdateAutocompletePredictions(forResultsController resultsController: GMSAutocompleteResultsViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

