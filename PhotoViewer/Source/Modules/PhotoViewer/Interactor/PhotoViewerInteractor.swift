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
    
    typealias RequestType = FlickrPhotoNetworking.Request
    
    let request: RequestType
    
    init(withRequest request: @escaping RequestType) {
        self.request = request
    }
    
    func fetchData(completion: (FlickrPhoto?, Error?) -> Void) {
        
        guard task == nil || task?.isRunning == false else {
            return
        }
        
        task = try? request { flickrPhotoObject, error in
            print("hello")
        }
        
        task?.resume()
        
    }
    
}
