//
//  Animal.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 15/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

protocol AnimalProtocol {
    func animalRequester() -> Animal
}

struct Animal {
    var name: String
    var age: Int
    var animal: AnimalType
    
    enum AnimalType {
        case Dog
        case Cat
        case Parrot
        case Parekeet
        case Ferret
    }
}
