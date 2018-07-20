//
//  Animal.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 15/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

protocol Animal {
    
    var name: String { get set }
    var age: Int { get set }
    var specie: Species { get }
    
}

enum Species {
    case dog
    case cat
    case parrot
    case parekeet
    case ferret
}
