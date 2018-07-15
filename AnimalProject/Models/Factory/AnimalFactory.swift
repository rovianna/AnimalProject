//
//  AnimalFactory.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 15/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation

struct AnimalFactory {
    static func getAnimal(animal: Animal) -> AnimalProtocol {
        switch animal.animal {
        case .Dog: return Dog(animal: animal)
        case .Cat: return Cat(animal: animal)
        case .Ferret: return Ferret(animal: animal)
        case .Parekeet: return Parakeet(animal: animal)
        case .Parrot: return Parrot(animal: animal)
        }
    }
}
