//
//  PictureStore.swift
//  RoverpassDemo
//
//  Created by Jimmy Pocock on 1/26/17.
//  Copyright © 2017 Jimmy Pocock. All rights reserved.
//

import UIKit

enum ImageResult {
    case success(UIImage)
    case failure(Error)
}

enum ImageError: Error {
    case imageCreationError
}


struct PictureStore {

    private static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()

    static func processImageRequest(data: Data?, error: Error?) -> ImageResult {

        guard let imageData = data, let image = UIImage(data: imageData) else {
            // Couldn't create an image
            if data == nil {
                return .failure(error!)
            } else {
                return .failure(ImageError.imageCreationError)
            }
        }

        return .success(image)
    }

    static func fetchImage(for picture: Picture, completion: @escaping (ImageResult) -> Void) {

        let pictureURL = picture.url
        let request = URLRequest(url: pictureURL!)

        let task = session.dataTask(with: request) { (data, response, error) -> Void in

            let result = self.processImageRequest(data: data, error: error)
            completion(result)
        }
        task.resume()
    }
}
