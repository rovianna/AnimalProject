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
    var specie: Species!
    var animal : Animal!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(specie != nil, "animal can't be nil")
            loader(specie: specie)
    }
    
    func loader(specie: Species) {
        switch specie {
        case .dog: self.navigationItem.title = "Adicionar um novo cachorro"
        case .cat: self.navigationItem.title = "Adicionar um novo gato"
        case .ferret: self.navigationItem.title = "Adicionar um novo furão"
        case .parekeet: self.navigationItem.title = "Adicionar um novo periquito"
        case .parrot: self.navigationItem.title = "Adicionar um novo papagaio"
        }
    }
    
    @IBAction func addAnimalAction(_ sender: UIButton) {
        if let name = animalNameTextField.text, let age = Int(animalAgeTextField.text!){
            let newAnimal = AnimalFactory.getAnimal(species: specie, name: name, age: age)
            delegate?.addNewAnimal(self, animal: newAnimal)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
