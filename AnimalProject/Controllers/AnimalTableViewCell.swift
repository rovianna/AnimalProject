//
//  AnimalTableViewCell.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 16/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var animalAgeLabel: UILabel!
    @IBOutlet weak var animalSpeciesImage: UIImageView!
    @IBOutlet weak var animalPriorityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(animal: Animal) {
        animalNameLabel.text = animal.name
        animalAgeLabel.text = "\(animal.age) anos"
        switch animal.animal {
        case .Dog: animalSpeciesImage.image = #imageLiteral(resourceName: "dog")
        case .Cat: animalSpeciesImage.image = #imageLiteral(resourceName: "cat")
        case .Ferret: animalSpeciesImage.image = #imageLiteral(resourceName: "ferret")
        case .Parrot: animalSpeciesImage.image = #imageLiteral(resourceName: "macaw")
        case .Parekeet: animalSpeciesImage.image = #imageLiteral(resourceName: "bird")
        }
        animalPriorityLabel.text = animal.age > 3 ? "Sim" : "Não"
    }
}
