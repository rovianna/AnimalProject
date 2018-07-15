//
//  Ferret.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 15/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation

class Ferret: AnimalProtocol {
    var animal: Animal
    init(animal: Animal) {
        self.animal = animal
    }
    
    func animalRequester() -> Animal {
        return animal
    }
}
