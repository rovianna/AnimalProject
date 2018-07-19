//
//  DetailAnimalViewController.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 15/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

protocol DetailAnimalViewControllerDelegate {
    func addNewAnimal(_ DetailAnimalViewController: DetailAnimalViewController, animal: Animal)
}

class DetailAnimalViewController: UIViewController {
    
    class var instance: DetailAnimalViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "Detail") as! DetailAnimalViewController
        return view
    }
    
    @IBOutlet weak var animalNameTextField: UITextField!
    @IBOutlet weak var animalAgeTextField: UITextField!
    @IBOutlet weak var animalQueueLabel: UILabel!
    
    var delegate: DetailAnimalViewControllerDelegate?
    var specie: Animal.Specie?
    var animals = [Animal]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(specie != nil, "animal can't be nil")
        if let specie = specie {
            loader(specie: specie)
        }
    }
    
    func loader(specie: Animal.Specie) {
        switch specie {
        case .Dog: self.navigationItem.title = "Adicionar um novo cachorro"
        case .Cat: self.navigationItem.title = "Adicionar um novo gato"
        case .Ferret: self.navigationItem.title = "Adicionar um novo furão"
        case .Parekeet: self.navigationItem.title = "Adicionar um novo periquito"
        case .Parrot: self.navigationItem.title = "Adicionar um novo papagaio"
        }
    }
    
    @IBAction func addAnimalAction(_ sender: UIButton) {
        if let name = animalNameTextField.text, let age = Int(animalAgeTextField.text!), let specie = specie {
            let newAnimal = Animal(name: name, age: age, animal: specie, didShower: false, didPet: false)
            delegate?.addNewAnimal(self, animal: newAnimal)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
