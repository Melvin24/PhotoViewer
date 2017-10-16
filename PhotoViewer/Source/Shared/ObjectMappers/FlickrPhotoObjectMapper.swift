//
//  FlickrPhotoObjectMapper.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 14/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import UIKit

/// Used for mapping flickr response to a concrete type.
struct FlickrPhotoObjectMapper {
    
    /// Flickr API Response Parsing Keys.
    enum Keys: String {
        case id, farm, server, secret, stat, code, message, photos, photo
    }
    
    /// API Error codes according to: https://www.flickr.com/services/api/flickr.photos.search.htm
    enum FlickrAPIErrorCode: Int {
        case unknown = 0
        case apiUnavailable = 10
        case invalidAPIKey = 100
        case serviceUnavailable = 105
        case badURL = 116
    }
    
    /// Object mapper error.
    enum FlickrPhotoObjectMapperError: Error {
        
        /// Failed to unwrap with reason.
        case unwrapError(String)
        
        /// Flickr API error with error code.
        case FlickrAPIError(FlickrAPIErrorCode)
        
    }
    
    /// The concrete object for this mapper.
    public typealias Object = FlickrPhoto
    
    /// Decode the JSON object into a FlickrPhoto collection.
    ///
    /// - Parameter JSON: The JSON to decode.
    /// - Returns: A FlickrPhoto collection.
    /// - Throws: See `FlickrPhotoObjectMapperError`.
    public func decode(JSON: AnyObject) throws -> [Object] {
        
        guard let jsonDictionary = JSON as? [String: Any] else {
            throw FlickrPhotoObjectMapperError.unwrapError("Could not unwrap JSON as \([String: Any].self)")
        }
        
        if let code = jsonDictionary[Keys.code.rawValue] as? Int {
            throw FlickrPhotoObjectMapperError.FlickrAPIError(FlickrAPIErrorCode(rawValue: code) ?? .unknown)
        }
        
        guard let photoDictionary = jsonDictionary[Keys.photos.rawValue] as? [String: Any] else {
            throw FlickrPhotoObjectMapperError.unwrapError("Could not unwrap photos from JSON as \([String: Any].self)")
        }
        
        guard let photos = photoDictionary[Keys.photo.rawValue] as? [[String : Any]] else {
            throw FlickrPhotoObjectMapperError.unwrapError("Could not unwrap photos from photoDictionary as \([[String: Any]].self)")
        }
        
        return photos.reduce([]) { accumulate, current in
            
            guard let photoID = current[Keys.id.rawValue] as? String,
                  let farm    = current[Keys.farm.rawValue] as? Int ,
                  let server  = current[Keys.server.rawValue] as? String ,
                  let secret  = current[Keys.secret.rawValue] as? String else {
                    return accumulate
            }
            
            var flickrPhoto = FlickrPhoto(id: photoID,
                                        farm: String(farm),
                                      server: server,
                                      secret: secret,
                                        size: .mediumRectangle,
                                       image: nil )
            
            if let imageURL  = URL(string: flickrPhoto.urlPath),
               let imageData = try? Data(contentsOf: imageURL),
               let image     = UIImage(data: imageData) {
                    flickrPhoto.image = image
            }
            
            return accumulate + [flickrPhoto]
            
        }
        
    }
}
