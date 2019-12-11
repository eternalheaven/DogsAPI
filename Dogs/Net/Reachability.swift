//
//  Reachability.swift
//  Dogs
//
//  Created by Alexandr Khrutskiy on 08/12/2019.
//  Copyright © 2019 Alexandr Khrutskiy. All rights reserved.
// Заглушка доступности сети, сеть доступна

import Foundation
import ResourceNetworking

class Reachability: ReachabilityProtocol {
    
    var isReachable: Bool {
        return true
    }
}
