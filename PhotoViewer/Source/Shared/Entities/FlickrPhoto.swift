//
//  FlickrPhoto.swift
//  PhotoViewer

import Foundation

/// A struct to represent flickr photo.
struct FlickrPhoto {
    
    enum Size: String {
        /// 75x75
        case smallSquare = "s"
        /// 150x150
        case largeSquare = "q"
        /// 100x75
        case thumbnail = "t"
        /// 240x180
        case smallRectangle = "m"
        /// 640x480
        case mediumRectangle = "z"
        /// 1024x768
        case largeRectangle = "b"
        /// Original Image size
        case original = "o"
    }
    
    /// Photo ID
    var id: String
    
    /// Photo farm ID
    var farm: String
    
    /// Photo server ID
    var server: String
    
    /// Sercret
    var secret: String
    
    /// Photo Size
    var size: Size
    
    /// Photo URL 
    var urlPath: String {
        return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_\(size).jpg"
    }
    
}
