//
//  PhotoViewerInteractor.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 14/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

class PhotoViewerInteractor: Interactor {
    
    var task: Task?
    
    typealias RequestType = ((String) -> FlickrPhotoNetworking.Request)
    
    let request: RequestType
    
    init(withRequest request: @escaping RequestType) {
        self.request = request
    }
    
    func fetchData(withArgument argument: String, completion: @escaping ([FlickrPhoto]?, Error?) -> Void) {
        
        guard task == nil || task?.isRunning == false else {
            return
        }
        
        do {
            
            let flickrPhotoRequest = request(argument)
            
            task = try flickrPhotoRequest { flickrPhotoCollection, error in
                completion(flickrPhotoCollection, error)
            }
            
            task?.resume()
            
        } catch let error {
            completion(nil, error)
        }
        
    }
    
}
