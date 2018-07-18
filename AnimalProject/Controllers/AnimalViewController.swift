//
//  AnimalViewController.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 15/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

class AnimalViewController: UIViewController {
    
    var animals = [Animal]() {
        didSet {
            animals.sort(by: { left, right in
                return left.age > right.age
            })
            receiveAnimals(animals)
        }
    }
    
    @IBOutlet weak var nextAnimalButton: UIButton!
    @IBOutlet weak var animalsTableView: UITableView!
    
    var source: AnimalDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAnimals()
        nextAnimalButton.isEnabled = false
    }
    
    func loadAnimals() {
        animals.append(Animal(name: "Totó", age: 4, animal: .Dog, didShower: false, didPet: false))
        animals.append(Animal(name: "Lazarento", age: 3, animal: .Cat, didShower: false, didPet: false))
        animals.append(Animal(name: "Louro", age: 5, animal: .Parekeet, didShower: false, didPet: false))
        animals.append(Animal(name: "Furaozinho", age: 2, animal: .Ferret, didShower: false, didPet: false))
        animals.append(Animal(name: "Papa", age: 3, animal: .Parrot, didShower: false, didPet: false))
        animals.append(Animal(name: "Auau", age: 3, animal: .Dog, didShower: false, didPet: false))
    }
    
    func receiveAnimals(_ animals: [Animal]) {
        let source = AnimalDataSource(tableView: animalsTableView, animals: animals)
        applyDataSource(source: source)
    }
    
    func applyDataSource(source: AnimalDataSource) {
        source.delegate = self
        self.source = source
        animalsTableView.reloadData()
    }
    
    @IBAction func addAnimalOptionAction(_ sender: UIBarButtonItem) {
        let animalChoice = UIAlertController(title: "Adicionar novo animal", message: "Qual animal?", preferredStyle: .actionSheet)
        let view = DetailAnimalViewController.instance
        let dogAction = UIAlertAction(title: "Cachorro", style: .default) { (alert) in
            view.specie = .Dog
            self.navigationController?.show(view, sender: nil)
        }
        let catAction = UIAlertAction(title: "Gato", style: .default) { (alert) in
            view.specie = .Cat
            self.navigationController?.show(view, sender: nil)
        }
        let parrotAction = UIAlertAction(title: "Papagaio", style: .default) { (alert) in
            view.specie = .Parrot
            self.navigationController?.show(view, sender: nil)
        }
        let parakeetAction = UIAlertAction(title: "Periquito", style: .default) { (alert) in
            view.specie = .Parekeet
            self.navigationController?.show(view, sender: nil)
        }
        let ferretAction = UIAlertAction(title: "Furão", style: .default) { (alert) in
            view.specie = .Ferret
            self.navigationController?.show(view, sender: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        animalChoice.addAction(dogAction)
        animalChoice.addAction(catAction)
        animalChoice.addAction(parrotAction)
        animalChoice.addAction(parakeetAction)
        animalChoice.addAction(ferretAction)
        animalChoice.addAction(cancelAction)
        view.delegate = self
        present(animalChoice, animated: true, completion: nil)
    }
    
    @IBAction func callNextAnimalAction(_ sender: UIButton) {
        guard let animal = animals.first else { return }
        if animal.didPet && animal.didShower {
        animals.removeFirst()
        }
    }
    
    @IBAction func seeCurrentAnimalAction(_ sender: UIBarButtonItem) {
        guard let animal = animals.first else { return }
        let currentAnimal = CurrentAnimalViewController.instance
        currentAnimal.delegate = self
        currentAnimal.animal = animal
        self.navigationController?.show(currentAnimal, sender: nil)
    }
    
}

extension AnimalViewController: AnimalDelegate {
    func selected(_ AnimalDataSource: AnimalDataSource, animal: Animal) {
        
    }
}

extension AnimalViewController: DetailAnimalViewControllerDelegate {
    func addNewAnimal(_ DetailAnimalViewController: DetailAnimalViewController, animal: Animal){
        self.animals.append(animal)
    }
}

extension AnimalViewController: CurrentAnimalViewControllerDelegate {
    func getCurrentAnimal(_ currentAnimalViewController: CurrentAnimalViewController, animal: Animal) {
        guard let index = self.animals.index(where: {$0.name == animal.name}) else { return }
        self.animals[index] = animal
        nextAnimalButton.isEnabled = true
    }
}
