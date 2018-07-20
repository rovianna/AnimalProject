//
//  AnimalFactory.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 15/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation

class AnimalFactory {
    static func getAnimal(species: Species,name: String, age: Int) -> Animal {
        switch species {
        case .dog: return Dog(name: name, age: age)
        case .cat: return Cat(name: name, age: age)
        case .ferret: return Ferret(name: name, age: age)
        case .parekeet: return Parekeet(name: name, age: age)
        case .parrot: return Parrot(name: name, age: age)
        }
    }
}
