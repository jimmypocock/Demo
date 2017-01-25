
//
//  SearchViewController.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/24/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import UIKit
import GooglePlaces

class SearchViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var searchField: UITextField!

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // Show what the user types in after each new text field change
        print(searchField.text!)

        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Access UITextFieldDelegate functions
        searchField.delegate = self

        // Autofocus to search field when view loads
        searchField.becomeFirstResponder()
    }
}
