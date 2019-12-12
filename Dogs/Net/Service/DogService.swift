//
//  DogService.swift
//  Dogs
//
//  Created by Alexandr Khrutskiy on 08/12/2019.
//  Copyright © 2019 Alexandr Khrutskiy. All rights reserved.
//  Сетевой слой

import Foundation
import ResourceNetworking


class DogService {
    
    private init() { }
    static let instance = DogService()
    
     enum EndPoint {
        case allBreeds
        case randomImageForBreed(String)
        
        var endPoint: String {
            switch self {
            case .allBreeds:
                return "https://dog.ceo/api/breeds/list/all"
            case .randomImageForBreed(let breed):
                return "https://dog.ceo/api/breed/\(breed)/images/random"
            }
        }
    }
    
    
    func fetchAllBreeds(isSuccess: @escaping (BreedsRaw) -> Void,
                        isFailure: @escaping (Error) -> Void) {
        let endPoint = EndPoint.allBreeds.endPoint
        guard let url = URL(string: endPoint) else { return }
        let breedsResource = Resource<BreedsRaw>(url: url, headers: nil)
        load(resource: breedsResource,
             completion: { operation in
                switch operation {
                case .success(let raw):
                    isSuccess(raw)
                case .failure(let error):
                print(error.localizedDescription)
                    isFailure(error)
                }
        })
    }
    
    func fetchBreedImg(for breed: String,
                       isSuccess: @escaping (BreedImage) -> Void,
                       isFailure: @escaping (Error) -> Void) {
        let endPoint = EndPoint.randomImageForBreed(breed).endPoint
        guard let url = URL(string: endPoint) else { return }
        let imgBreedResource = Resource<BreedImage>(url: url, headers: nil)
        load(resource: imgBreedResource,
             completion: { operation in
                switch operation {
                case .success(let raw):
                    isSuccess(raw)
                case .failure(let error):
                    print(error.localizedDescription)
                    isFailure(error)
                }
        })
    }
}

extension DogService: NetworkHelperProtocol {
    @discardableResult
    func load<A>(resource: Resource<A>,
                 completion: @escaping (OperationCompletion<A>) -> ()) -> Cancellation? {
        let reachability = Reachability()
        let network = NetworkHelper(reachability: reachability)
        return network.load(resource: resource, completion: completion)
    }
}
