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
    
    func configure(name: String, age: Int, specie: Species) {
        animalNameLabel.text = name
        animalAgeLabel.text = "\(age) anos"
        switch specie {
        case .dog: animalSpeciesImage.image = #imageLiteral(resourceName: "dog")
        case .cat: animalSpeciesImage.image = #imageLiteral(resourceName: "cat")
        case .ferret: animalSpeciesImage.image = #imageLiteral(resourceName: "ferret")
        case .parrot: animalSpeciesImage.image = #imageLiteral(resourceName: "macaw")
        case .parekeet: animalSpeciesImage.image = #imageLiteral(resourceName: "bird")
        }
        animalPriorityLabel.text = age > 3 ? "Sim" : "Não"
    }
}
