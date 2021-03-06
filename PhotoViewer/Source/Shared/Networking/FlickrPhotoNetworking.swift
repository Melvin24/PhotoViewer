//
//  PhotoViewerNetworking.swift
//  PhotoViewer

import Foundation

class FlickrPhotoNetworking {
    
    /// Network Error
    enum FlickrPhotoNetworkingError: Error {
        
        /// Unable to buld  URL Error
        case unableToBuildURL
        
        /// No Data from Flickr API Request.
        case noData
        
        /// Failed to Parse Flickr API Response.
        case unableToParseData
        
        /// No Network Connection.
        case noConnection
    }
    
    static let apiKey = "c262e55489a26702151250891dad37ce"

    typealias Mapper = FlickrPhotoObjectMapper
    
    /// The completion type used to signify multiple video match info objects and an error.
    public typealias Completion = ([Mapper.Object], Swift.Error?) -> Void
    
    /// A request signature used to make a task for fetching video match info.
    public typealias Request = (@escaping Completion) throws -> Task
    
    /// Call this method to obtain a request to fetch flickr photos. 
    static func fetchFlickrPhotos(forSearchTerm searchTerm: String, session: URLSession) -> Request {
        
        return { completion in
            
            guard let flickrURL = flickrURLFor(searchTerm: searchTerm) else {
                throw FlickrPhotoNetworkingError.unableToBuildURL
            }
            
            return session.dataTask(with: flickrURL) { data, response, error in
                
                guard error?._code != NSURLErrorTimedOut && error?._code != NSURLErrorNotConnectedToInternet else {
                    completion([], FlickrPhotoNetworkingError.noConnection)
                    return
                }
                
                guard let data = data else {
                    completion([], FlickrPhotoNetworkingError.noData)
                    return
                }
                
                guard let jsonObject = jsonObject(forData: data) else {
                    completion([], FlickrPhotoNetworkingError.unableToParseData)
                    return
                }
                
                do {
                    let flickrPhotos = try decode(jsonObject: jsonObject)
                    completion(flickrPhotos, nil)
                } catch let mapperError {
                    completion([], mapperError)
                }
                
            }
        }

    }
    
    private static func decode(jsonObject: AnyObject) throws -> [Mapper.Object] {
        let decoder = FlickrPhotoObjectMapper()
        let flickrPhotos = try decoder.decode(JSON: jsonObject)
        return flickrPhotos
    }

    private static func jsonObject(forData data: Data) -> AnyObject? {
        return try? JSONSerialization.jsonObject(with: data, options: []) as AnyObject
    }
    
    private static func flickrURLFor(searchTerm: String) -> URL? {
        guard let escapedTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .alphanumerics) else {
            return nil
        }
        
        let URLPath = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&text=\(escapedTerm)&per_page=30&format=json&nojsoncallback=1"
        
        return URL(string: URLPath)
    }
}
