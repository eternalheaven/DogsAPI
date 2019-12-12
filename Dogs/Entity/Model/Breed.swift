//
//  Breed.swift
//  Dogs
//
//  Created by Alexandr Khrutskiy on 08/12/2019.
//  Copyright © 2019 Alexandr Khrutskiy. All rights reserved.
//

import Foundation

struct Breed {
    let breed: String
    let subBreed: [String]
    var imageURL: String
    
    mutating func setImageURL(_ url: String) {
        self.imageURL = url
    }
}
