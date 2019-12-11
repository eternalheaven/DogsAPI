//
//  Builder.swift
//  Dogs
//
//  Created by Alexandr Khrutskiy on 08/12/2019.
//  Copyright © 2019 Alexandr Khrutskiy. All rights reserved.
//

import Foundation

class BreedsBuilder {
    static func build(from raw: BreedsRaw) -> [Breed] {
        var breeds = [Breed]()
        raw.message.forEach { (key, value) in
            breeds.append(Breed(breed: key, subBreed: value))
        }
  
        return breeds
    }
}
