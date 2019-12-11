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
    
    private struct EndPoint {
        static let allBreeds = "https://dog.ceo/api/breeds/list/all"
    }
  
    func fetchAllBreeds(isSuccess: @escaping (BreedsRaw) -> Void,
                        isFailure: @escaping (Error) -> Void) {
        guard let url = URL(string: EndPoint.allBreeds) else { return }
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
