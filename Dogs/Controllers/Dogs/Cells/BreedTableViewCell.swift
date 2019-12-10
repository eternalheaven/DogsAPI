//
//  BreedTableViewCell.swift
//  Khrutskiy DZ 2 Dogs
//
//  Created by Alexandr Khrutskiy on 08/12/2019.
//  Copyright © 2019 Alexandr Khrutskiy. All rights reserved.
//

import UIKit

class BreedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var breed: UILabel! {
        didSet {
            breed.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var subBreed: UILabel! {
        didSet {
            subBreed.numberOfLines = 0
        }
    }

    @IBOutlet weak var breedImage: UIImageView! {
        didSet {
        }
    }
    
    func configure(breed: Breed) {
        self.breed.text = "Порода: " + breed.breed
        self.subBreed.text = "Подпорода: " + breed.subBreed.description
    }
}
