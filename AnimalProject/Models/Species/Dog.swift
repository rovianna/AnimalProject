//
//  Dog.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 15/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import Foundation

class Dog: Animal {
    var name: String
    
    var age: Int
    
    var specie: Species = .dog
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
