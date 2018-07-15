//
//  AnimalViewController.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 15/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class AnimalViewController: UIViewController {

    var animals = [Animal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animals.append(Animal(name: "Totó", age: 4, animal: .Dog))
        animals.append(Animal(name: "Lazarento", age: 3, animal: .Cat))
        
        for animal in animals {
            let animalQueue = AnimalFactory.getAnimal(animal: animal)
            print("DEV: \(animalQueue.animalRequester())")
        }
    }

}
