//
//  DogImageService(по аналогии с Сережиным).swift
//  Khrutskiy DZ 2 Dogs
//
//  Created by Alexandr Khrutskiy on 11/12/2019.
//  Copyright © 2019 Alexandr Khrutskiy. All rights reserved.
//

import Foundation
import ResourceNetworking

class DogImageService {
    private init() {}
    static let instance = DogImageService()
    
    private struct EndPointImage {        
        static let randBreedImg = "https://dog.ceo/api/breed/hound/images/random"
    }

    func fetchBreedImg (isSuccess: @escaping (BreedImage) -> Void,
                        isFailure: @escaping (Error) -> Void) {
        
}
