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
    @IBOutlet weak var animalSpeciesLabel: UILabel!
    @IBOutlet weak var animalPriorityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(animal: Animal) {
        animalNameLabel.text = animal.name
        animalAgeLabel.text = "\(animal.age) anos"
        switch animal.animal {
        case .Dog: animalSpeciesLabel.text = "Cachorro"
        case .Cat: animalSpeciesLabel.text = "Gato"
        case .Ferret: animalSpeciesLabel.text = "Furão"
        case .Parrot: animalSpeciesLabel.text = "Papagaio"
        case .Parekeet: animalSpeciesLabel.text = "Periquito"
        }
        animalPriorityLabel.text = animal.age > 3 ? "Sim" : "Não"
    }
}
