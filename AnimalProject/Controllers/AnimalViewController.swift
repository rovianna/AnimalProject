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
                if left.age > 3 && right.age <= 3 {
                    return left.age > right.age
                } else {
                    return false
                }
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
    }
    
    func loadAnimals() {
        animals.append(AnimalFactory.getAnimal(species: .dog, name: "Totó", age: 4))
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
            view.specie = .dog
            self.navigationController?.show(view, sender: nil)
        }
        let catAction = UIAlertAction(title: "Gato", style: .default) { (alert) in
            view.specie = .cat
            self.navigationController?.show(view, sender: nil)
        }
        let parrotAction = UIAlertAction(title: "Papagaio", style: .default) { (alert) in
            view.specie = .parrot
            self.navigationController?.show(view, sender: nil)
        }
        let parakeetAction = UIAlertAction(title: "Periquito", style: .default) { (alert) in
            view.specie = .parekeet
            self.navigationController?.show(view, sender: nil)
        }
        let ferretAction = UIAlertAction(title: "Furão", style: .default) { (alert) in
            view.specie = .ferret
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
        animals.removeFirst()
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
