//
//  Strings.swift
//  PhotoViewer
//
//  Created by John, Melvin (Associate Software Developer) on 14/10/2017.
//  Copyright © 2017 John, Melvin (Associate Software Developer). All rights reserved.
//

import Foundation

struct Strings {
    
    static var localizedString = {
        return NSLocalizedString($0, comment: $1)
    }
    
    public static var searchBarPlaceholderName: String {
        return localizedString("photo-viewer.search-bar.placeholder", "Search bar placeholder name")
    }
    
}
