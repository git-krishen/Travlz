//
//  PixabayHelper.swift
//  Travlz
//
//  Created by Krishen Sharma on 4/11/24.
//

import Foundation
import UIKit
import SwiftUI
import Combine

class PixabayHelper: ObservableObject {
    fileprivate let plistHelper = PropertyFileHelper(file: "Pixabay")  // Allows us access to the Pixabay.plist config file
    fileprivate var pixabayData: PixabayData?  // Holds decoded JSON data loaded from Pixabay
    fileprivate var currentSearchText = ""
    fileprivate enum networkError: Error { case statusCodeIndicatesError }
    
    // Configuration data
    fileprivate var pixabayUrl: String
    fileprivate let pixabayApiKey: String
    fileprivate let pixabayImageType: String
    fileprivate let pixabayResultPerPage: String
    
    /// This published imageData ensures that when the data changes the View in ContentView is re-rendered
    @Published public var imageData: [PixabayImage] = [PixabayImage(imageName: "error")]
    
    init() {
        pixabayUrl = plistHelper.readProperty(key: "PixabayUrl")!
        pixabayApiKey = plistHelper.readProperty(key: "PixabayApiKey")!
        pixabayImageType = plistHelper.readProperty(key: "PixabayImageType")!
        pixabayResultPerPage = plistHelper.readProperty(key: "PixabayResultsPerPage")!
    }
    
    /// Gets image data from the Pixabay REST API
    /// - Parameter searchFor: The kind of image to search for
    public func loadImages(searchFor: String) async {
        if searchFor == currentSearchText { return }
        currentSearchText = searchFor

        pixabayUrl += pixabayApiKey + "&" + pixabayImageType + "&" + "per_page" + "=" + pixabayResultPerPage + "&" + "q" + "=" + searchFor
        
        guard let url = URL(string: pixabayUrl) else {
                    print("Invalid url...")
                    return
                }
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        let decodedData = try? JSONDecoder().decode(PixabayData.self, from: data)
                        DispatchQueue.main.async {
                            self.pixabayData = decodedData
                            self.imageData = self.pixabayData?.hits ?? [PixabayImage(imageName: "")]
                            self.imageData.shuffle()
                        }
                    } else {
                        self.pixabayData = nil
                        self.imageData = [PixabayImage(imageName: "error")]
                    }
                }.resume()
    }
}
