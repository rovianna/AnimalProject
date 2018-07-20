//
//  Cat.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 15/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation

class Cat: Animal {
    var name: String
    
    var age: Int
    
    var specie: Species = .cat
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    
}
