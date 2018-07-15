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
    var dataSource: AnimalDataSource?
    
    @IBOutlet weak var animalsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animals.append(Animal(name: "Totó", age: 4, animal: .Dog))
        animals.append(Animal(name: "Lazarento", age: 3, animal: .Cat))
        
        for animal in animals {
            let animalQueue = AnimalFactory.getAnimal(animal: animal)
            print("DEV: \(animalQueue.animalRequester())")
        }
        
        let source = AnimalDataSource(tableView: animalsTableView, animals: animals)
        applyDataSource(source: source)
    }
    
    func applyDataSource(source: AnimalDataSource){
        source.delegate = self
        self.dataSource = source
        animalsTableView.reloadData()
    }

    @IBAction func addAnimalOptionAction(_ sender: UIBarButtonItem) {
        let animalChoice = UIAlertController(title: "Adicionar novo animal", message: "Qual animal?", preferredStyle: .actionSheet)
        let dogAction = UIAlertAction(title: "Cachorro", style: .default) { (alert) in
            print("Dog")
        }
        let catAction = UIAlertAction(title: "Gato", style: .default) { (alert) in
            print("Cat")
        }
        let parrotAction = UIAlertAction(title: "Papagaio", style: .default) { (alert) in
            print("Parrot")
        }
        let parakeetAction = UIAlertAction(title: "Periquito", style: .default) { (alert) in
            print("Parakeet")
        }
        let ferretAction = UIAlertAction(title: "Furão", style: .default) { (alert) in
            print("Ferret")
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        animalChoice.addAction(dogAction)
        animalChoice.addAction(catAction)
        animalChoice.addAction(parrotAction)
        animalChoice.addAction(parakeetAction)
        animalChoice.addAction(ferretAction)
        animalChoice.addAction(cancelAction)
                present(animalChoice, animated: true, completion: nil)
    }
}

extension AnimalViewController: AnimalDelegate {
    func selected(_ AnimalDataSource: AnimalDataSource, animal: Animal) {
        
    }
}
