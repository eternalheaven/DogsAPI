//
//  BreedTableViewCell.swift
//  Khrutskiy DZ 2 Dogs
//
//  Created by Alexandr Khrutskiy on 08/12/2019.
//  Copyright © 2019 Alexandr Khrutskiy. All rights reserved.
//

import UIKit
import AlamofireImage

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
            breedImage.contentMode = .scaleAspectFill
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        breedImage.image = nil
    }
}

extension BreedTableViewCell {
    func configure(breed: Breed) {
         self.breed.text = "Порода: " + breed.breed
         self.subBreed.text = "Подпорода: " + breed.subBreed.description
         
         if !breed.imageURL.isEmpty {
             setImage(withURLString: breed.imageURL)
         }
     }
     
     private func setImage(withURLString: String) {
         guard let url = URL(string: withURLString) else { return }
         self.breedImage.af_setImage(withURL: url)
     }
}

