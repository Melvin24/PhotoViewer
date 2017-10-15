//
//  FlickrPhotoObjectMapper.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 14/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

struct FlickrPhotoObjectMapper {
    
    enum Keys: String {
        case stat, code, message
    }
    
    /// API Error codes according to: https://www.flickr.com/services/api/flickr.photos.search.htm
    enum FlickrAPIErrorCode: Int {
        case unknown = 0
        case apiUnavailable = 10
        case invalidAPIKey = 100
        case serviceUnavailable = 105
        case badURL = 116
    }
    
    enum FlickerPhotoObjectMapperError: Error {
        case unwrapError(String)
        case FlickrAPIError(FlickrAPIErrorCode)
    }
    /// The concrete object for this mapper
    public typealias Object = FlickrPhoto
    
    /// Decode the JSON object into the concrete object type. See `Object`
    ///
    /// - Parameter JSON: The JSON to decode
    /// - Returns: A concrete object.
    /// - Throws: See `JSONDecodingError`
    public func decode(JSON: AnyObject) throws -> Object {
        
        guard let jsonDictionary = JSON as? [String: Any] else {
            throw FlickerPhotoObjectMapperError.unwrapError("Could not unwrap JSON as \([String: Any].self)")
        }
        
        if let code = jsonDictionary[Keys.code.rawValue] as? Int {
            throw FlickerPhotoObjectMapperError.FlickrAPIError(FlickrAPIErrorCode(rawValue: code) ?? .unknown)
        }
        
        
        
        return FlickrPhoto()
    }
}
