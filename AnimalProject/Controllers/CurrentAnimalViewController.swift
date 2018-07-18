//
//  CurrentAnimalViewController.swift
//  AnimalProject
//
//  Created by Rodrigo Vianna on 17/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit

protocol CurrentAnimalViewControllerDelegate {
    func getCurrentAnimal(_ currentAnimalViewController: CurrentAnimalViewController, animal: Animal)
}

class CurrentAnimalViewController: UIViewController {

    class var instance: CurrentAnimalViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "current") as! CurrentAnimalViewController
        return view
    }
    
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var currentFeedbackLabel: UILabel!
    @IBOutlet weak var showerAnimalButton: UIButton!
    @IBOutlet weak var petAnimalButton: UIButton!
    @IBOutlet weak var finishAnimalButton: UIButton!
    
    var delegate: CurrentAnimalViewControllerDelegate?
    var animal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(animal != nil, "Animal can't be nil")
    }
    
    @IBAction func showerAnimalAction(_ sender: UIButton) {
        animal?.didShower = true
        showerAnimalButton.isEnabled = false
        petAnimalButton.isEnabled = true
        
    }
    
    @IBAction func petAnimalAction(_ sender: UIButton) {
        animal?.didPet = true
        petAnimalButton.isEnabled = false
        finishAnimalButton.isEnabled = true
    }
    
    @IBAction func endAnimalVisitAction(_ sender: UIButton) {
        guard let animal = animal else { return }
        delegate?.getCurrentAnimal(self, animal: animal)
        self.navigationController?.popViewController(animated: true)
    }
}
