//
//  PixabayData.swift
//  Travlz
//
//  Created by Krishen Sharma on 4/11/24.
//

import Foundation

public struct PixabayData: Decodable {
    public var totalHits: Int
    public var hits: [PixabayImage]
    public var total: Int
}

public struct PixabayImage: Decodable, Identifiable {
    public var id: Int
    public var largeImageURL: String
    public var webformatHeight: Int
    public var webformatWidth: Int
    public var likes: Int
    public var imageWidth: Int
    public var user_id: Int
    public var views: Int
    public var comments: Int
    public var pageURL: String
    public var imageHeight: Int
    public var webformatURL: String
    public var type: String
    public var previewHeight: Int
    public var tags: String
    public var downloads: Int
    public var user: String
    public var imageSize: Int
    public var previewWidth: Int
    public var userImageURL: String
    public var previewURL: String
    
    // Use coding keys to map "user_id" to "userId"
    // If you remap one JSON field you have to supply all the other unmapped fields too
    enum CodingKeys: String, CodingKey {
        case largeImageURL
        case webformatHeight
        case webformatWidth
        case likes
        case imageWidth
        case id
        case user_id
        case views
        case comments
        case pageURL
        case imageHeight
        case webformatURL
        case type
        case previewHeight
        case tags
        case downloads
        case user
        case imageSize
        case previewWidth
        case userImageURL
        case previewURL
    }
    
    init(imageName: String) {
        id = 0
        largeImageURL = imageName
        webformatHeight = 0
        webformatWidth = 0
        likes = 0
        imageWidth = 0
        user_id = 0
        views = 0
        comments = 0
        pageURL = imageName
        imageHeight = 0
        webformatURL = imageName
        type = "photo"
        previewHeight = 0
        tags = ""
        downloads = 0
        user = ""
        imageSize = 0
        previewWidth = 0
        userImageURL = imageName
        previewURL = imageName
    }
}
